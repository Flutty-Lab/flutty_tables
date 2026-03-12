# flutty_tables

[![pub package](https://img.shields.io/pub/v/flutty_tables.svg)](https://pub.dev/packages/flutty_tables)
[![pub points](https://img.shields.io/pub/points/flutty_tables)](https://pub.dev/packages/flutty_tables/score)
[![likes](https://img.shields.io/pub/likes/flutty_tables)](https://pub.dev/packages/flutty_tables/score)

Advanced table components for Flutter with sorting, filtering and pagination.

## Installation

```yaml
dependencies:
  flutty_tables: ^0.1.1
```

## Usage

## Quick start

```dart
import 'package:flutty_tables/flutty_tables.dart';

StaticRowTable(
  title: 'User info',
  elements: [
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
  ],
);

ExpandableRowTable(
  title: 'Orders',
  elements: [
    ExpandedRowTableElement(
      id: 'order-1',
      rowBuilder: () => const Text('Order #1'),
      expendedBuilder: () => const [Text('Details')],
    ),
  ],
);
```

## Example

See `packages/flutty_tables/example` for a small demo app.

## API Documentation

See the [API docs](https://pub.dev/documentation/flutty_tables/latest/) for full documentation.
