import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(OverflowingApp());

class OverflowingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[200],
        body: _buildOverflowingColumn(),
      ),
    );
  }

  Widget _buildOverflowingColumn() {
    return SafeArea(
      child: Center(
        child: Stoplight(),
      ),
    );
  }
}

class Stoplight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 10),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _light(Colors.red),
            _light(Colors.yellow),
            _light(Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _light(Color color) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(width: 10)),
            width: 300,
            height: 300));
  }
}
