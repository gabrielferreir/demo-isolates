import 'package:demo_isolate/cron.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'fibonacci.dart';

class ComputePage extends StatefulWidget {
  const ComputePage({Key? key}) : super(key: key);

  @override
  _ComputePageState createState() => _ComputePageState();
}

class _ComputePageState extends State<ComputePage> {
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
              onPressed: () async {
                final fibo = await compute(fibonacci, 40);
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
