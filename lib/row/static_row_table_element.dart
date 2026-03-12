import 'package:flutter/material.dart';

class StaticRowTableElement {
  StaticRowTableElement({required this.rowBuilder, this.displayBuilder});

  final Widget Function() rowBuilder;
  // Use this builder to filter displayed row dynamically
  final bool Function()? displayBuilder;
}
