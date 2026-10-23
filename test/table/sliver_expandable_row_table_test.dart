import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutty_tables/row/expanded_row_table_element.dart';
import 'package:flutty_tables/table/sliver_expandable_row_table.dart';

void main() {
  group('SliverExpandableRowTable', () {
    testWidgets('builds only the rows visible in the viewport', (tester) async {
      var builtRows = 0;
      var builtExpanded = 0;
      final elements = List.generate(
        200,
        (index) => ExpandedRowTableElement(
          id: 'row-$index',
          rowBuilder: () {
            builtRows++;
            return Text('Row $index');
          },
          expendedBuilder: () {
            builtExpanded++;
            return const [Text('expanded')];
          },
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [SliverExpandableRowTable(elements: elements)],
            ),
          ),
        ),
      );

      expect(find.text('Row 0'), findsOneWidget);
      expect(find.text('Row 199'), findsNothing);
      expect(builtRows, lessThan(50));
      expect(builtExpanded, lessThan(50));

      await tester.scrollUntilVisible(
        find.text('Row 199'),
        500,
        scrollable: find.byType(Scrollable),
      );

      expect(find.text('Row 199'), findsOneWidget);
    });

    testWidgets('skips elements hidden by displayBuilder', (tester) async {
      final elements = [
        ExpandedRowTableElement(
          id: 'visible-1',
          rowBuilder: () => const Text('Visible 1'),
          expendedBuilder: () => const [],
        ),
        ExpandedRowTableElement(
          id: 'hidden',
          displayBuilder: () => false,
          rowBuilder: () => const Text('Hidden'),
          expendedBuilder: () => const [],
        ),
        ExpandedRowTableElement(
          id: 'visible-2',
          rowBuilder: () => const Text('Visible 2'),
          expendedBuilder: () => const [],
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [SliverExpandableRowTable(elements: elements)],
            ),
          ),
        ),
      );

      expect(find.text('Visible 1'), findsOneWidget);
      expect(find.text('Visible 2'), findsOneWidget);
      expect(find.text('Hidden'), findsNothing);
    });

    testWidgets('expands a row to reveal its children', (tester) async {
      final elements = [
        ExpandedRowTableElement(
          id: 'row-1',
          rowBuilder: () => const Text('Row 1'),
          expendedBuilder: () => const [Text('Expanded content')],
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverExpandableRowTable(
                  title: 'Table title',
                  elements: elements,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Table title'), findsOneWidget);
      expect(find.text('Expanded content'), findsNothing);

      await tester.tap(find.text('Row 1'));
      await tester.pumpAndSettle();

      expect(find.text('Expanded content'), findsOneWidget);
    });
  });
}
