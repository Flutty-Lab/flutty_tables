import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutty_tables/row/expanded_row_table_element.dart';
import 'package:flutty_tables/table/expandable_row_table_card.dart';
import 'package:flutty_test/golden_utils.dart';

void main() {
  group('ExpandedRowTableCard Golden Tests', () {
    simpleTestGoldens(
      'expanded_row_table_card',
      widget: SizedBox(
        width: 300,
        child: ExpandableRowTableCard(
          title: 'Table title',
          elements: [
            ExpandedRowTableElement(
              id: '123',
              rowBuilder: () => const Text('Title row 1'),
              expendedBuilder: () => [const Text('data 1')],
            ),
            ExpandedRowTableElement(
              id: '234',
              rowBuilder: () => const Text('Title row 2'),
              expendedBuilder: () => [const Text('data 2')],
            ),
            ExpandedRowTableElement(
              id: '345',
              rowBuilder: () => const Text('Title row 3'),
              expendedBuilder: () => [const Text('data 3')],
            ),
          ],
        ),
      ),
      height: 226,
    );

    simpleTestGoldens(
      'expanded_row_table_card_no_radius',
      widget: SizedBox(
        width: 300,
        child: ExpandableRowTableCard(
          title: 'Table title',
          radius: BorderRadius.zero,
          elements: [
            ExpandedRowTableElement(
              id: '123',
              rowBuilder: () => const Text('Title row 1'),
              expendedBuilder: () => [const Text('data 1')],
            ),
            ExpandedRowTableElement(
              id: '234',
              rowBuilder: () => const Text('Title row 2'),
              expendedBuilder: () => [const Text('data 2')],
            ),
            ExpandedRowTableElement(
              id: '345',
              rowBuilder: () => const Text('Title row 3'),
              expendedBuilder: () => [const Text('data 3')],
            ),
          ],
        ),
      ),
      height: 226,
    );

    simpleTestGoldens(
      'expanded_row_table_card_no_radius_no_title',
      widget: SizedBox(
        width: 300,
        child: ExpandableRowTableCard(
          radius: BorderRadius.zero,
          elements: [
            ExpandedRowTableElement(
              id: '123',
              rowBuilder: () => const Text('Title row 1'),
              expendedBuilder: () => [const Text('data 1')],
            ),
            ExpandedRowTableElement(
              id: '234',
              rowBuilder: () => const Text('Title row 2'),
              expendedBuilder: () => [const Text('data 2')],
            ),
            ExpandedRowTableElement(
              id: '345',
              rowBuilder: () => const Text('Title row 3'),
              expendedBuilder: () => [const Text('data 3')],
            ),
          ],
        ),
      ),
      height: 226,
    );
  });
}
