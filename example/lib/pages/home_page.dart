import 'package:flutter/material.dart';

import 'expandable_row_table_demo_page.dart';
import 'static_row_table_demo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flutty_tables demo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FilledButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const StaticRowTableDemoPage(),
              ),
            ),
            child: const Text('StaticRowTable / Card'),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ExpandableRowTableDemoPage(),
              ),
            ),
            child: const Text('ExpandableRowTable / Card'),
          ),
        ],
      ),
    );
  }
}
