import 'dart:isolate';

import 'package:demo_isolate/cron.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'fibonacci.dart';

class FibonacciParams {
  final SendPort sendPort;
  final int value;

  FibonacciParams({
    required this.sendPort,
    required this.value,
  });
}

void wrapperFibonacci(FibonacciParams params) {
  final result = fibonacci(params.value);
  params.sendPort.send(result);
}

class IsolatesPage extends StatefulWidget {
  const IsolatesPage({Key? key}) : super(key: key);

  @override
  _IsolatesPageState createState() => _IsolatesPageState();
}

class _IsolatesPageState extends State<IsolatesPage> {
  int? result;
  Isolate? isolate;

  void startFibonacciIsolate(int value) async {
    ReceivePort receivePort = ReceivePort();
    isolate = await Isolate.spawn(wrapperFibonacci,
        FibonacciParams(sendPort: receivePort.sendPort, value: value));
    receivePort.listen((data) {
      setState(() {
        result = data;
      });
      if (isolate != null) isolate!.kill(priority: Isolate.immediate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Cron(),
          OutlinedButton(
              onPressed: () {
                startFibonacciIsolate(42);
              },
              child: Text('Fibonacci')),
          Text(result != null ? result.toString() : '-')
        ]));
  }
}
