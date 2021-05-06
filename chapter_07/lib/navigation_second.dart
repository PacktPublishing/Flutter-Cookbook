import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  @override
  _NavigationSecondState createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
        appBar: AppBar(
          title: Text('Navigation Second Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  child: Text('Red'),
                  onPressed: () {
                    color = Colors.red[700];
                    Navigator.pop(context, color);
                  }),
              ElevatedButton(
                  child: Text('Green'),
                  onPressed: () {
                    color = Colors.green[700];
                    Navigator.pop(context, color);
                  }),
              ElevatedButton(
                  child: Text('Blue'),
                  onPressed: () {
                    color = Colors.blue[700];
                    Navigator.pop(context, color);
                  }),
            ],
          ),
        ));
  }
}
