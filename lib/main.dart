import 'package:flutter/material.dart';

import 'compute_page.dart';
import 'isolates_page.dart';
import 'normal_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IsolatesPage(),
    );
  }
}
