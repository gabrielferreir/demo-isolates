import 'dart:async';

import 'package:flutter/material.dart';

class Cron extends StatefulWidget {
  const Cron({Key? key}) : super(key: key);

  @override
  _CronState createState() => _CronState();
}

class _CronState extends State<Cron> {
  double time = 0;
  Timer? t;

  Timer setTimeout(Function(Timer) callback) =>
      Timer.periodic(Duration(milliseconds: 10), callback);

  @override
  void initState() {
    super.initState();
    setTimeout((timer) {
      t = timer;
      setState(() {
        time++;
      });
    });
  }

  @override
  Widget build(BuildContext context) =>
      Text(time.toString(), style: TextStyle(fontSize: 32));

  @override
  void dispose() {
    super.dispose();
  }
}
