import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int index;
  DetailScreen(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Screen'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.amber),
                child: Hero(
                  tag: 'cup$index',
                  child: Icon(
                    Icons.free_breakfast,
                    size: 96,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(),
            )
          ],
        ));
  }
}
