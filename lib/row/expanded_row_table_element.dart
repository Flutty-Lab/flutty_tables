import 'package:flutter/material.dart';

/// A single expandable row of an [ExpandableRowTable].
class ExpandedRowTableElement {
  /// Creates an [ExpandedRowTableElement] with a unique [id], a collapsed
  /// [rowBuilder] and an [expendedBuilder] for the expanded content.
  ExpandedRowTableElement({
    required this.id,
    required this.rowBuilder,
    required this.expendedBuilder,
    this.displayBuilder,
  });

  /// Unique identifier of the row, used as its widget key.
  final String id;

  /// Builds the always-visible part of the row.
  final Widget Function() rowBuilder;

  /// Builds the widgets revealed when the row is expanded.
  final List<Widget> Function() expendedBuilder;

  /// Use this builder to filter displayed row dynamically
  final bool Function()? displayBuilder;
}
