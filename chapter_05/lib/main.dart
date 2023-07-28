import 'package:flutter/material.dart';
import 'package:stopwatch/login_screen.dart';
import './stopwatch.dart';

void main() => runApp(const StopwatchApp());

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        StopWatch.route: (context) => StopWatch(
              email: '',
              name: '',
            ),
      },
      initialRoute: '/',
    );
  }
}
