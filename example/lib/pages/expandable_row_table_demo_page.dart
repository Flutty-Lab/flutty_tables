import 'package:flutter/material.dart';
import 'package:flutty_tables/flutty_tables.dart';

class ExpandableRowTableDemoPage extends StatelessWidget {
  const ExpandableRowTableDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final elements = <ExpandedRowTableElement>[
      ExpandedRowTableElement(
        id: 'order-1',
        rowBuilder: () => const Text('Order #1'),
        expendedBuilder: () => const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Details: 2 items, total \$42'),
          ),
        ],
      ),
      ExpandedRowTableElement(
        id: 'order-2',
        rowBuilder: () => const Text('Order #2'),
        expendedBuilder: () => const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Details: 1 item, total \$15'),
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('ExpandableRowTable')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ExpandableRowTable(
            title: 'ExpandableRowTable',
            elements: elements,
          ),
          const SizedBox(height: 16),
          ExpandableRowTableCard(
            title: 'ExpandableRowTableCard',
            elements: elements,
          ),
        ],
      ),
    );
  }
}
