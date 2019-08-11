import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  bool isTicking = false;
  int milliseconds = 0;
  Timer timer;

  final laps = <int>[];

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30),
          _buildCounter(context),
          SizedBox(height: 20),
          _buildButtonRow(),
          _buildLapDisplay(),
        ],
      ),
    );
  }

  Column _buildCounter(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Lap ${laps.length + 1}',
          style: Theme.of(context).textTheme.subhead,
        ),
        Text(
          _secondsText(milliseconds),
          style: Theme.of(context).textTheme.headline,
        ),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            color: Colors.green,
            textColor: Colors.white,
            child: Text('Start'),
            onPressed: isTicking ? null : _startTimer),
        SizedBox(width: 20),
        RaisedButton(
          color: Colors.yellow,
          child: Text('Lap'),
          onPressed: isTicking ? _lap : null,
        ),
        SizedBox(width: 20),
        FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text('Stop'),
          onPressed: isTicking ? _stopTimer : null,
        ),
      ],
    );
  }

  Widget _buildLapDisplay() {
    return Flexible(
      child: ListView(
        children: laps.map((milliseconds) {
          return ListTile(
            title: Text(_secondsText(milliseconds)),
          );
        }).toList(),
      ),
    );
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);

    setState(() {
      milliseconds = 0;
      laps.clear();
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer.cancel();

    setState(() {
      isTicking = false;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
