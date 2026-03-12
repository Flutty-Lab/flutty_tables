import 'package:flutter/material.dart';
import 'package:flutty_ds/dimens.dart';
import 'package:flutty_tables/row/expanded_row_table_element.dart';
import 'package:flutty_tables/table/expandable_row_table.dart';

class ExpandableRowTableCard extends StatelessWidget {
  ExpandableRowTableCard({
    required this.elements,
    this.title,
    this.firstColor = Colors.grey,
    this.secondColor = Colors.white54,
    BorderRadius? radius,
    super.key,
  }) : radius = radius ?? BorderRadius.circular(Dimens.doubleRadius);

  final List<ExpandedRowTableElement> elements;

  final String? title;
  final Color firstColor;
  final Color secondColor;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: radius),
      child: ExpandableRowTable(
        elements: elements,
        title: title,
        firstColor: firstColor,
        secondColor: secondColor,
        radius: radius,
      ),
    );
  }
}
