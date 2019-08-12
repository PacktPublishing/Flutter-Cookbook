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
  final itemHeight = 60.0;
  final scrollController = ScrollController();

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
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 20),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildControls() {
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
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemCount: laps.length,
        itemExtent: itemHeight,
        itemBuilder: (context, index) {
          final milliseconds = laps[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            title: Text('Lap ${index + 1}'),
            trailing: Text(_secondsText(milliseconds)),
          );
        },
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
    setState(() {
      timer.cancel();
      isTicking = false;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });

    scrollController.animateTo(
      itemHeight * laps.length,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
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
