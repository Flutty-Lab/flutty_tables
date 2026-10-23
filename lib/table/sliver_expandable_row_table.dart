import 'package:flutter/material.dart';
import 'package:flutty_ds/dimens.dart';
import 'package:flutty_ds/theme_extension.dart';
import 'package:flutty_tables/row/expanded_row_table_element.dart';

/// Sliver variant of [ExpandableRowTable] for lazy rendering.
///
/// Rows are built on demand as they enter the viewport, and each row's
/// `expendedBuilder` is only called when the row itself is built. Must be
/// placed inside a [CustomScrollView]; use [ExpandableRowTable] in box
/// contexts (e.g. inside an [ExpansionTile]).
class SliverExpandableRowTable extends StatelessWidget {
  SliverExpandableRowTable({
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
    return SliverMainAxisGroup(
      slivers: [
        if (title != null)
          SliverToBoxAdapter(
            child: DecoratedBox(
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
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final element = _elements[index];

              final lineColor = index.isEven ? firstColor : secondColor;

              final expendedElements = element.expendedBuilder();

              return DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: index.isEven
                        ? Alignment.topLeft
                        : Alignment.bottomRight,
                    end: index.isEven
                        ? Alignment.bottomRight
                        : Alignment.topLeft,
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
                  data:
                      context.theme.copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: Key(element.id),
                    showTrailingIcon: expendedElements.isNotEmpty,
                    title: element.rowBuilder(),
                    children: expendedElements,
                  ),
                ),
              );
            },
            childCount: _elements.length,
          ),
        ),
      ],
    );
  }
}
