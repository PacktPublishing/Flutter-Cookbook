import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/e_commerce_screen_after.dart';

void main() => runApp(StaticApp());

class StaticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          elevation: 10,
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'LeckerliOne',
              fontSize: 24,
            ),
          ),
        ),
      ),
      home: ECommerceScreen(),
    );
  }
}

//fontFamily: 'LeckerliOne',
