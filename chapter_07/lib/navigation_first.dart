import 'package:flutter/material.dart';

import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  @override
  _NavigationFirstState createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.blue[700];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Navigation First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text('Change Color'),
            onPressed: () {
              _navigateAndGetColor(context);
            }),
      ),
    );
  }

  _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationSecond()),
    );
    setState(() {
      color = color;
    });
  }
}
