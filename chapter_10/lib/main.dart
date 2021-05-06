import 'package:flutter/material.dart';
import 'package:area/area.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Packages Demo',
      home: PackageScreen(),
    );
  }
}

class PackageScreen extends StatefulWidget {
  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWidth = TextEditingController();
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Package App'),
      ),
      body: Column(
        children: [
          AppTextField(txtWidth, 'Width'),
          AppTextField(txtHeight, 'Height'),
          Padding(
            padding: EdgeInsets.all(24),
          ),
          ElevatedButton(
              child: Text('Calculate Area'),
              onPressed: () {
                double width = double.tryParse(txtWidth.text);
                double height = double.tryParse(txtHeight.text);
                String res = calculateAreaRect(width, height);
                setState(() {
                  result = res;
                });
              }),
          Padding(
            padding: EdgeInsets.all(24),
          ),
          Text(result),
        ],
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  AppTextField(this.controller, this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: label),
      ),
    );
  }
}
