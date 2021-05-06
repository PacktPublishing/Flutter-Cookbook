import './camera.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Machine Learning',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: CameraScreen(),
    );
  }
}

