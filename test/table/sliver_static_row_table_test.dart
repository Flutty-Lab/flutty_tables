import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutty_tables/row/static_row_table_element.dart';
import 'package:flutty_tables/table/sliver_static_row_table.dart';

void main() {
  group('SliverStaticRowTable', () {
    testWidgets('builds only the rows visible in the viewport', (tester) async {
      var builtRows = 0;
      final elements = List.generate(
        200,
        (index) => StaticRowTableElement(
          rowBuilder: () {
            builtRows++;
            return Text('Row $index');
          },
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [SliverStaticRowTable(elements: elements)],
            ),
          ),
        ),
      );

      expect(find.text('Row 0'), findsOneWidget);
      expect(find.text('Row 199'), findsNothing);
      expect(builtRows, lessThan(50));

      await tester.scrollUntilVisible(
        find.text('Row 199'),
        500,
        scrollable: find.byType(Scrollable),
      );

      expect(find.text('Row 199'), findsOneWidget);
    });

    testWidgets('skips elements hidden by displayBuilder', (tester) async {
      final elements = [
        StaticRowTableElement(rowBuilder: () => const Text('Visible 1')),
        StaticRowTableElement(
          displayBuilder: () => false,
          rowBuilder: () => const Text('Hidden'),
        ),
        StaticRowTableElement(rowBuilder: () => const Text('Visible 2')),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [SliverStaticRowTable(elements: elements)],
            ),
          ),
        ),
      );

      expect(find.text('Visible 1'), findsOneWidget);
      expect(find.text('Visible 2'), findsOneWidget);
      expect(find.text('Hidden'), findsNothing);
    });

    testWidgets('renders the title header', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverStaticRowTable(
                  title: 'Table title',
                  elements: [
                    StaticRowTableElement(
                      rowBuilder: () => const Text('Row 1'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Table title'), findsOneWidget);
      expect(find.text('Row 1'), findsOneWidget);
    });
  });
}
