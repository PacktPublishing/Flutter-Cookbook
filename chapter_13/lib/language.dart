import 'package:flutter/material.dart';
import 'ml.dart';
import 'result.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final TextEditingController txtLanguage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Detection'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: txtLanguage,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Enter some text in any language',
              ),
            ),
            Center(
                child: ElevatedButton(
              child: Text('Detect Language'),
              onPressed: () {
                MLHelper helper = MLHelper();
                helper.identifyLanguage(txtLanguage.text).then((result) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(result)));
                });
              },
            ))
          ],
        ),
      ),
    );
  }
}
