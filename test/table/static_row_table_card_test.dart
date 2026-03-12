import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutty_tables/row/static_row_table_element.dart';
import 'package:flutty_tables/table/static_row_table_card.dart';
import 'package:flutty_test/golden_utils.dart';

void main() {
  group('StaticRowTableCard Golden Tests', () {
    simpleTestGoldens(
      'static_row_table_card',
      widget: SizedBox(
        width: 300,
        child: StaticRowTableCard(
          title: 'Static table title',
          elements: [
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 1'))]),
            ),
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 2'))]),
            ),
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 3'))]),
            ),
          ],
        ),
      ),
      height: 160,
    );

    simpleTestGoldens(
      'static_row_table_card_no_radius',
      widget: SizedBox(
        width: 300,
        child: StaticRowTableCard(
          title: 'Static table title',
          radius: BorderRadius.zero,
          elements: [
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 1'))]),
            ),
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 2'))]),
            ),
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 3'))]),
            ),
          ],
        ),
      ),
      height: 160,
    );

    simpleTestGoldens(
      'static_row_table_card_no_radius_no_title',
      widget: SizedBox(
        width: 300,
        child: StaticRowTableCard(
          radius: BorderRadius.zero,
          elements: [
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 1'))]),
            ),
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 2'))]),
            ),
            StaticRowTableElement(
              rowBuilder: () =>
                  const Row(children: [Expanded(child: Text('Title row 3'))]),
            ),
          ],
        ),
      ),
      height: 160,
    );
  });
}
