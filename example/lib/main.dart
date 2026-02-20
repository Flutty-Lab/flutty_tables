import 'package:flutter/material.dart';
import 'package:flutty_tables/flutty_tables.dart';

void main() {
  runApp(const FluttyTablesExample());
}

class FluttyTablesExample extends StatelessWidget {
  const FluttyTablesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutty Tables Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutty Tables')),
        body: FluttyTable<Map<String, String>>(
          columns: [
            FluttyColumn(
              title: 'Name',
              cellBuilder: (item) => Text(item['name'] ?? ''),
            ),
            FluttyColumn(
              title: 'Email',
              cellBuilder: (item) => Text(item['email'] ?? ''),
            ),
          ],
          rows: const [
            {'name': 'Alice', 'email': 'alice@example.com'},
            {'name': 'Bob', 'email': 'bob@example.com'},
          ],
        ),
      ),
    );
  }
}
