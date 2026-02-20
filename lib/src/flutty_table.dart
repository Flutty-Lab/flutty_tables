import 'package:flutter/material.dart';
import 'package:flutty_ds/flutty_ds.dart';

import 'flutty_column.dart';

/// A customizable data table widget.
class FluttyTable<T> extends StatelessWidget {
  /// Creates a [FluttyTable].
  const FluttyTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  /// The column definitions for the table.
  final List<FluttyColumn<T>> columns;

  /// The data rows to display.
  final List<T> rows;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(FluttySpacing.md),
      child: Table(
        children: [
          TableRow(
            children: columns
                .map((col) => Padding(
                      padding: const EdgeInsets.all(FluttySpacing.sm),
                      child: Text(
                        col.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList(),
          ),
          ...rows.map(
            (row) => TableRow(
              children: columns
                  .map((col) => Padding(
                        padding: const EdgeInsets.all(FluttySpacing.sm),
                        child: col.cellBuilder(row),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
