import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutty_ds/dimens.dart';
import 'package:flutty_tables/row/static_row_table_element.dart';
import 'package:flutty_tables/table/static_row_table.dart';
import 'package:flutty_test/golden_utils.dart';

void main() {
  group('StaticRowTable Golden Tests', () {
    simpleTestGoldens(
      'static_row_table',
      widget: SizedBox(
        width: 300,
        child: StaticRowTable(
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
      'static_row_table_with_radius',
      widget: SizedBox(
        width: 300,
        child: StaticRowTable(
          title: 'Static table title',
          radius: BorderRadius.circular(Dimens.doubleRadius),
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
      'static_row_table_no_title',
      widget: SizedBox(
        width: 300,
        child: StaticRowTable(
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
