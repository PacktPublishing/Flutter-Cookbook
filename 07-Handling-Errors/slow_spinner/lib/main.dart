import 'package:flutter/material.dart';
import 'package:slow_spinner/animals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScrollingPage(),
    );
  }
}

class ScrollingPage extends StatefulWidget {
  @override
  _ScrollingPageState createState() => _ScrollingPageState();
}

class _ScrollingPageState extends State<ScrollingPage> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            final animal = Animals.all[index % Animals.all.length];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    ClipRect(
                      child: Transform.rotate(
                        angle: controller.offset * index / 1000,
                        child: Image.asset(
                          animal.filepath,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          color: Colors.black38,
                          width: double.infinity,
                          child: Text(
                            'Photographer: ${animal.credit}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
