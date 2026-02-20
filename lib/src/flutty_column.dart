import 'package:flutter/material.dart';

/// Defines a column for [FluttyTable].
class FluttyColumn<T> {
  /// Creates a [FluttyColumn].
  const FluttyColumn({
    required this.title,
    required this.cellBuilder,
  });

  /// The column header title.
  final String title;

  /// Builder function that creates the cell widget for a given row item.
  final Widget Function(T item) cellBuilder;
}
