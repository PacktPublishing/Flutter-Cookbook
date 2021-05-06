import 'dart:async';

class TimerBLoC {
  int seconds = 60;
  StreamController _secondsStreamController = StreamController();
  Stream get secondsStream =>
      _secondsStreamController.stream.asBroadcastStream();
  StreamSink get secondsSink => _secondsStreamController.sink;

  TimerBLoC(

  );

  Future decreaseSeconds() async {
    await Future.delayed(const Duration(seconds: 1));
    seconds--;
    secondsSink.add(seconds);
  }

  countDown() async {
    for (var i = seconds; i > 0; i--) {
      await decreaseSeconds();
      returnSeconds(seconds);
    }
  }

  int returnSeconds(seconds) {
    return seconds;
  }

  void dispose() {
    _secondsStreamController.close();
  }
}
