import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.orange
  ];
  final List<double> sizes = [100, 125, 150, 175, 200];
  final List<double> tops = [0, 50, 100, 150, 200];
  int iteration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
          actions: [
            IconButton(
              icon: Icon(Icons.run_circle),
              onPressed: () {
                iteration < colors.length - 1 ? iteration++ : iteration = 0;
                setState(() {
                  iteration = iteration;
                });
              },
            )
          ],
        ),
        body: Center(
            child: AnimatedContainer(
          duration: Duration(seconds: 1),
          color: colors[iteration],
          width: sizes[iteration],
          height: sizes[iteration],
          margin: EdgeInsets.only(top: tops[iteration]),
        )));
  }
}
