import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stopwatch/login_screen.dart';
import 'package:stopwatch/platform_alert.dart';
import 'package:stopwatch/stopwatch.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        StopWatch.route: (context) => StopWatch(),
      },
      initialRoute: '/',
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FlatButton(
          child: Text('Alert'),
          onPressed: () {
            final alert = PlatformAlert(
              title: 'Android Default Alert',
              message: 'Uh Oh, something has gone wrong!',
            );

            alert.show(context);
          }),
    ));
  }
}
