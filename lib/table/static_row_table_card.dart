import 'package:flutter/material.dart';
import 'package:flutty_ds/dimens.dart';
import 'package:flutty_tables/row/static_row_table_element.dart';
import 'package:flutty_tables/table/static_row_table.dart';

class StaticRowTableCard extends StatelessWidget {
  StaticRowTableCard({
    required List<StaticRowTableElement> elements,
    this.title,
    this.firstColor = Colors.grey,
    this.secondColor = Colors.white54,
    BorderRadius? radius,
    super.key,
  })  : radius = radius ?? BorderRadius.circular(Dimens.doubleRadius),
        _elements =
            elements.where((e) => e.displayBuilder?.call() ?? true).toList();

  final List<StaticRowTableElement> _elements;

  final String? title;
  final Color firstColor;
  final Color secondColor;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: radius),
      child: StaticRowTable(
        elements: _elements,
        title: title,
        firstColor: firstColor,
        secondColor: secondColor,
        radius: radius,
      ),
    );
  }
}
