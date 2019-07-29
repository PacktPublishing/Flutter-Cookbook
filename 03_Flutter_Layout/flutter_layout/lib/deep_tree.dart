import 'package:flutter/material.dart';

class DeepTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(),
                Text('Flutter is amazing.'),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.purple,
              ),
            ),
            Text('Its all widgets!'),
            Text('Let\'s find out how deep the rabbit hole goes.'),
          ],
        ),
      ),
    );
  }
}
