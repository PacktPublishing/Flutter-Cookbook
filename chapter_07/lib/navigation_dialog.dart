import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  @override
  _NavigationDialogState createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color color = Colors.blue[700];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text('Change Color'),
            onPressed: () {
              _showColorDialog(context);
            }),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    color = null;
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Very important question'),
          content: Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
                child: Text('Red'),
                onPressed: () {
                  color = Colors.red[700];
                  Navigator.pop(context, color);
                }),
            TextButton(
                child: Text('Green'),
                onPressed: () {
                  color = Colors.green[700];
                  Navigator.pop(context, color);
                }),
            TextButton(
                child: Text('Blue'),
                onPressed: () {
                  color = Colors.blue[700];
                  Navigator.pop(context, color);
                }),
          ],
        );
      },
    );
    setState(() {
      color = color;
    });
  }
}
