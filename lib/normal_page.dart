import 'package:demo_isolate/cron.dart';
import 'package:flutter/material.dart';

import 'fibonacci.dart';

class Normal extends StatefulWidget {
  const Normal({Key? key}) : super(key: key);

  @override
  _NormalState createState() => _NormalState();
}

class _NormalState extends State<Normal> {
  int? result;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Cron(),
          OutlinedButton(
              onPressed: () {
                final fibo = fibonacci(42);
                setState(() {
                  result = fibo;
                });
              },
              child: Text('Fibonacci')),
          Text(result != null ? result.toString() : '-')
        ]));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
