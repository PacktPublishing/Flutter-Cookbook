import 'package:flutter/material.dart';

main() {
  runApp(BadlyFormattedApp());
        }

class BadlyFormattedApp extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

      @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            key: scaffoldKey, appBar: AppBar(title: Text('Format Me')), body: Column(children: <Widget>[
              Text('First item', style: Theme.of(context).textTheme.headline),
          Text('Second item', style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
         RaisedButton(
              child: Text('Tap Me'),
              onPressed: () {
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                            duration: Duration(seconds: 2),
                            content:
                                Text('Yay!  You tapped me!  I\'m so happy')));
                      }), FlatButton.icon(
              onPressed: null,
                             icon: Icon(Icons.error_outline),
              label: Text('You can\'t tap me!'))
                ],
              )])));}}

