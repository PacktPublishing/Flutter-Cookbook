import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//for validation for email&pass
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() {
    if (validateAndSave()) {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Uron Challenge'),
        ),
        body: new Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
                key: formKey,
                child: new Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, //stretches login bar
                  children: <Widget>[
//Email, Email wont detect without @ symbol
                    new TextFormField(
                      decoration: new InputDecoration(labelText: 'Email'),
                      validator: (val) =>
                          !val.contains('@') ? 'Invalid Email' : null,
                      onSaved: (val) => _email = val,
                    ),

//Password
                    new TextFormField(
                      decoration: new InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) =>
                          value.isEmpty ? 'Password can\'t be empty' : null,
                      onSaved: (value) => _password = value,
                    ),

//forgot password
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(-1.1, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),

                    new RaisedButton(
                      child: new Text('Login',
                          style: new TextStyle(fontSize: 20.0)),
                      onPressed: validateAndSubmit,
                    )
                  ],
                ))));
  }
}
