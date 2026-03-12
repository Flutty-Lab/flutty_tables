import 'package:flutter/material.dart';
import 'package:flutty_tables/flutty_tables.dart';

class StaticRowTableDemoPage extends StatelessWidget {
  const StaticRowTableDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final elements = <StaticRowTableElement>[
      StaticRowTableElement(
        rowBuilder: () => const Row(
          children: [
            Expanded(child: Text('Name')),
            Text('Alice'),
          ],
        ),
      ),
      StaticRowTableElement(
        rowBuilder: () => const Row(
          children: [
            Expanded(child: Text('Email')),
            Text('alice@example.com'),
          ],
        ),
      ),
      StaticRowTableElement(
        rowBuilder: () => const Row(
          children: [
            Expanded(child: Text('Role')),
            Text('Admin'),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('StaticRowTable')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StaticRowTable(
            title: 'StaticRowTable',
            elements: elements,
          ),
          const SizedBox(height: 16),
          StaticRowTableCard(
            title: 'StaticRowTableCard',
            elements: elements,
          ),
        ],
      ),
    );
  }
}
