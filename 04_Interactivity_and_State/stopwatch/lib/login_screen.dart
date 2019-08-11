import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Runner'),
                validator: (text) =>
                    text.isEmpty ? 'Enter the runner\'s name.' : null,
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Continue'),
                onPressed: _validate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validate() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      return;
    }

    final name = _nameController.text;
  }
}
