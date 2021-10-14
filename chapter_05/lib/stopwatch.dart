import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  static const route = '/stopwatch';
  final String name;
  final String email;

  const StopWatch({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  late int milliseconds;
  final itemHeight = 60.0;
  final scrollController = ScrollController();
  late Timer timer;
  final laps = [];
  late bool isTicking = false;

  @override
  void initState() {
    super.initState();

    isTicking = false;
    milliseconds = 0;
  }

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
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
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          ),
          _buildControls()
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('Start'),
          onPressed: isTicking ? null : _startTimer,
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: const Text('Lap'),
          onPressed: isTicking ? _lap : null,
        ),
        const SizedBox(width: 20),
        Builder(
          builder: (context) => ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: const Text('Stop'),
            onPressed: isTicking ? () => _stopTimer(context) : null,
          ),
        ),
      ],
    );
  }

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      _onTick,
    );
    setState(() {
      laps.clear();
      isTicking = true;
    });
  }

  void _stopTimer(BuildContext context) {
    setState(() {
      timer.cancel();
      isTicking = false;
    });

    final controller = showBottomSheet(
      context: context,
      builder: _buildRunCompleteSheet,
    );

    Future.delayed(const Duration(seconds: 5)).then((_) {
      controller.close();
    });
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void _lap() {
    scrollController.animateTo(
      itemHeight * laps.length,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeight,
        itemCount: laps.length,
        itemBuilder: (context, index) {
          final milliseconds = laps[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            title: Text('Lap ${index + 1}'),
            trailing: Text(
              _secondsText(milliseconds),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRunCompleteSheet(BuildContext context) {
    final totalRuntime =
        laps.fold(milliseconds, (total, lap) => (total as dynamic) + lap);
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Container(
        color: Theme.of(context).cardColor,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Run Finished!',
                style: textTheme.headline6,
              ),
              Text(
                'Total Run Time is ${_secondsText(totalRuntime)}.',
              )
            ],
          ),
        ),
      ),
    );
  }
}
