import 'package:flutter/material.dart';
import 'package:flutty_ds/dimens.dart';
import 'package:flutty_ds/theme_extension.dart';
import 'package:flutty_tables/row/expanded_row_table_element.dart';

class ExpandableRowTable extends StatelessWidget {
  ExpandableRowTable({
    required List<ExpandedRowTableElement> elements,
    this.title,
    this.firstColor = Colors.grey,
    this.secondColor = Colors.white54,
    this.radius,
    super.key,
  }) : _elements =
            elements.where((e) => e.displayBuilder?.call() ?? true).toList();

  final List<ExpandedRowTableElement> _elements;

  final String? title;
  final Color firstColor;
  final Color secondColor;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  secondColor.withAlpha(150),
                  secondColor.withAlpha(200),
                ],
              ),
              borderRadius: radius != null
                  ? BorderRadius.only(
                      topLeft: radius!.topLeft,
                      topRight: radius!.topRight,
                    )
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.standardSpacing),
                      child: Text(
                        title!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ...List.generate(_elements.length, (index) {
          final element = _elements[index];

          final isDisplayed = element.displayBuilder?.call() ?? true;
          if (!isDisplayed) return const SizedBox.shrink();

          final lineColor = index.isEven ? firstColor : secondColor;

          final expendedElements = element.expendedBuilder();

          return DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: index.isEven ? Alignment.topLeft : Alignment.bottomRight,
                end: index.isEven ? Alignment.bottomRight : Alignment.topLeft,
                colors: [lineColor.withAlpha(80), lineColor.withAlpha(150)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: index == 0 && radius != null && title == null
                    ? radius!.topLeft
                    : Radius.zero,
                topRight: index == 0 && radius != null && title == null
                    ? radius!.topRight
                    : Radius.zero,
                bottomLeft: index == _elements.length - 1 && radius != null
                    ? radius!.bottomLeft
                    : Radius.zero,
                bottomRight: index == _elements.length - 1 && radius != null
                    ? radius!.bottomRight
                    : Radius.zero,
              ),
            ),
            child: Theme(
              data: context.theme.copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                key: Key(element.id),
                showTrailingIcon: expendedElements.isNotEmpty,
                title: element.rowBuilder(),
                children: expendedElements,
              ),
            ),
          );
        }),
      ],
    );
  }
}
