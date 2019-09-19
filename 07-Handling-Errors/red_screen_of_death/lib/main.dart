import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red Screen of DOOM!',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF8f0719),
      ),
      home: ScreenChooser(),
    );
  }
}

class ScreenChooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Red Screen of Doom!'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading:
                Text('These screens do not work.  See if you can fix them!'),
          ),
          ErrorTile(
            text: 'Full Screen Error',
            onTapped: (_) => FullScreenError(),
          ),
          ErrorTile(
            text: 'Partial Exploded Widget',
            onTapped: (_) => PartialError(),
          )
        ],
      ),
    );
  }
}

class ErrorTile extends StatelessWidget {
  final String text;
  final WidgetBuilder onTapped;

  const ErrorTile({Key key, this.text, this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(text),
          trailing: Icon(CupertinoIcons.forward),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: onTapped,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}

class FullScreenError extends StatelessWidget {
  final String message;

  const FullScreenError({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full Screen Error')),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class PartialError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mostly Working')),
      body: GridView(
        children: <Widget>[
          Tile(color: Colors.green),
          Tile(color: Colors.purple),
          Tile(color: Colors.orange),
          Tile(
              color: Colors.blue,
              decoration: BoxDecoration(shape: BoxShape.circle)),
          Tile(color: Colors.cyan),
          Tile(color: Colors.yellow),
        ],
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final Color color;
  final BoxDecoration decoration;

  const Tile({Key key, this.color, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      decoration: decoration,
      height: 200,
    );
  }
}
