import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutty_tables/row/expanded_row_table_element.dart';

void main() {
  group('ExpandedRowTableElement', () {
    test('should create instance with required parameters', () {
      final element = ExpandedRowTableElement(
        id: 'test-id',
        rowBuilder: () => const Text('Row'),
        expendedBuilder: () => [const Text('Expanded')],
      );

      expect(element.id, 'test-id');
      expect(element.rowBuilder, isNotNull);
      expect(element.expendedBuilder, isNotNull);
      expect(element.displayBuilder, isNull);
    });

    test('should create instance with displayBuilder', () {
      final element = ExpandedRowTableElement(
        id: 'test-id',
        rowBuilder: () => const Text('Row'),
        expendedBuilder: () => [const Text('Expanded')],
        displayBuilder: () => true,
      );

      expect(element.displayBuilder, isNotNull);
      expect(element.displayBuilder!(), isTrue);
    });

    test('rowBuilder should return widget', () {
      const widget = Text('Test Row');
      final element = ExpandedRowTableElement(
        id: 'test-id',
        rowBuilder: () => widget,
        expendedBuilder: () => [],
      );

      final result = element.rowBuilder();
      expect(result, equals(widget));
    });

    test('expendedBuilder should return list of widgets', () {
      final widgets = [const Text('Item 1'), const Text('Item 2')];
      final element = ExpandedRowTableElement(
        id: 'test-id',
        rowBuilder: () => const Text('Row'),
        expendedBuilder: () => widgets,
      );

      final result = element.expendedBuilder();
      expect(result, equals(widgets));
      expect(result.length, 2);
    });

    test('displayBuilder should control visibility', () {
      var shouldDisplay = true;
      final element = ExpandedRowTableElement(
        id: 'test-id',
        rowBuilder: () => const Text('Row'),
        expendedBuilder: () => [],
        displayBuilder: () => shouldDisplay,
      );

      expect(element.displayBuilder!(), isTrue);

      shouldDisplay = false;
      expect(element.displayBuilder!(), isFalse);
    });
  });
}
