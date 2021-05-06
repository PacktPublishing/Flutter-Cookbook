import 'package:flutter/material.dart';
import 'countdown_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  @override
  _StreamHomePageState createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  TimerBLoC timerBloc;
  int seconds;
  @override
  void initState() {
    timerBloc = TimerBLoC();
    seconds = timerBloc.seconds;
    timerBloc.countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: timerBloc.secondsStream,
          initialData: seconds,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error!');
            }
            if (snapshot.hasData) {
              return Center(
                  child: Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 96),
              ));
            } else {
              return Center();
            }
          },
        ),
      ),
    );
  }
}
