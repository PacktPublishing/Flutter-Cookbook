import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  int seconds;
  Timer timer;

  @override
  void initState() {
    super.initState();

    seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Text(
          '$seconds ${_secondsText()}',
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }

  String _secondsText() => seconds == 1 ? 'second' : 'seconds';

  void _onTick(Timer time) {
    setState(() {
      ++seconds;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
