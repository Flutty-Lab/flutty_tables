import 'package:flutter/material.dart';

class ExpandedRowTableElement {
  ExpandedRowTableElement({
    required this.id,
    required this.rowBuilder,
    required this.expendedBuilder,
    this.displayBuilder,
  });

  final String id;
  final Widget Function() rowBuilder;
  final List<Widget> Function() expendedBuilder;
  // Use this builder to filter displayed row dynamically
  final bool Function()? displayBuilder;
}
