import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PictureScreen extends StatefulWidget {
  final XFile picture;
  PictureScreen(this.picture);
  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.picture.path),
          Container(
              height: deviceHeight / 1.5,
              child: Image.file(File(widget.picture.path))),
          Row(
            children: [
              ElevatedButton(
                child: Text('Text Recognition'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
