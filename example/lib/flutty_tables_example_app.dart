import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class FluttyTablesExampleApp extends StatelessWidget {
  const FluttyTablesExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutty Tables Example',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
