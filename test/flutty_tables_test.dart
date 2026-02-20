import 'package:flutter_test/flutter_test.dart';
import 'package:flutty_tables/flutty_tables.dart';

void main() {
  test('FluttyColumn stores title', () {
    final column = FluttyColumn<String>(
      title: 'Name',
      cellBuilder: (item) => throw UnimplementedError(),
    );

    expect(column.title, 'Name');
  });
}
