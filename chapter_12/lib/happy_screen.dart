import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class HappyScreen extends StatefulWidget {
  @override
  _HappyScreenState createState() => _HappyScreenState();
}

class _HappyScreenState extends State<HappyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Happy!'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('I\'m happy!'),
          onPressed: () {
            FirebaseAnalytics().logEvent(name: 'Happy', parameters: null);
          },
        ),
      ),
    );
  }
}
