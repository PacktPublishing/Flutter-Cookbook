import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String result;
  ResultScreen(this.result);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Result'), 
      ), 
      body: Container( 
        child: Padding( 
          padding: EdgeInsets.all(24), 
          child: SelectableText(widget.result, 
            showCursor: true, 
            cursorColor: Theme.of(context).accentColor, 
            cursorWidth: 5, 
            toolbarOptions: ToolbarOptions(copy: true, selectAll: true), 
            scrollPhysics: ClampingScrollPhysics(), 
            onTap: (){}, 
          )), 
      ), 
    ); 
  }
}
