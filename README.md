# flutty_tables

[![pub package](https://img.shields.io/pub/v/flutty_tables.svg)](https://pub.dev/packages/flutty_tables)
[![pub points](https://img.shields.io/pub/points/flutty_tables)](https://pub.dev/packages/flutty_tables/score)
[![likes](https://img.shields.io/pub/likes/flutty_tables)](https://pub.dev/packages/flutty_tables/score)

Advanced table components for Flutter with sorting, filtering and pagination.

## Installation

```yaml
dependencies:
  flutty_tables: ^0.1.0
```

## Usage

```dart
import 'package:flutty_tables/flutty_tables.dart';

FluttyTable<User>(
  columns: [
    FluttyColumn(
      title: 'Name',
      cellBuilder: (user) => Text(user.name),
    ),
  ],
  rows: users,
);
```

## API Documentation

See the [API docs](https://pub.dev/documentation/flutty_tables/latest/) for full documentation.
