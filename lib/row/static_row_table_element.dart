import 'package:material_ui/material_ui.dart';

/// A single row of a [StaticRowTable].
class StaticRowTableElement {
  /// Creates a [StaticRowTableElement].
  StaticRowTableElement({required this.rowBuilder, this.displayBuilder});

  /// Builds the row content.
  final Widget Function() rowBuilder;

  /// Use this builder to filter displayed row dynamically
  final bool Function()? displayBuilder;
}
