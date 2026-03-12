import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutty_tables/row/static_row_table_element.dart';

void main() {
  group('StaticRowTableElement', () {
    test('should create instance with required parameters', () {
      final element = StaticRowTableElement(
        rowBuilder: () => const Text('Row'),
      );

      expect(element.rowBuilder, isNotNull);
      expect(element.displayBuilder, isNull);
    });

    test('should create instance with displayBuilder', () {
      final element = StaticRowTableElement(
        rowBuilder: () => const Text('Row'),
        displayBuilder: () => true,
      );

      expect(element.displayBuilder, isNotNull);
      expect(element.displayBuilder!(), isTrue);
    });

    test('rowBuilder should return widget', () {
      const widget = Text('Test Row');
      final element = StaticRowTableElement(
        rowBuilder: () => widget,
      );

      final result = element.rowBuilder();
      expect(result, equals(widget));
    });

    test('displayBuilder should control visibility', () {
      var shouldDisplay = true;
      final element = StaticRowTableElement(
        rowBuilder: () => const Text('Row'),
        displayBuilder: () => shouldDisplay,
      );

      expect(element.displayBuilder!(), isTrue);

      shouldDisplay = false;
      expect(element.displayBuilder!(), isFalse);
    });

    test('displayBuilder can return false by default', () {
      final element = StaticRowTableElement(
        rowBuilder: () => const Text('Row'),
        displayBuilder: () => false,
      );

      expect(element.displayBuilder!(), isFalse);
    });
  });
}
