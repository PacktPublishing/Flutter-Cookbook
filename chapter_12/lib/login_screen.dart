import 'package:cookbook_ch_12/shared/firebase_authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import './happy_screen.dart';
import './upload_file.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _message = '';
  bool _isLogin = true;
  final TextEditingController txtUserName = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  FirebaseAuthentication auth;
  // final FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuthentication();
      // FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageReceived);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                auth.logout().then((value) {
                  if (value) {
                    setState(() {
                      _message = 'User Logged Out';
                    });
                  } else {
                    _message = 'Unable to Log Out';
                  }
                });
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(36),
          child: ListView(
            children: [
              userInput(),
              passwordInput(),
              btnMain(),
              btnSecondary(),
              btnGoogle(),
              txtMessage(),
            ],
          ),
        ));
  }

  Widget userInput() {
    return Padding(
        padding: EdgeInsets.only(top: 24),
        child: TextFormField(
          controller: txtUserName,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'User Name', icon: Icon(Icons.verified_user)),
          validator: (text) => text.isEmpty ? 'User Name is required' : '',
        ));
  }

  Widget passwordInput() {
    return Padding(
        padding: EdgeInsets.only(top: 24),
        child: TextFormField(
          controller: txtPassword,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'password', icon: Icon(Icons.enhanced_encryption)),
          validator: (text) => text.isEmpty ? 'Password is required' : '',
        ));
  }

  Widget btnMain() {
    String btnText = _isLogin ? 'Log in' : 'Sign up';
    return Padding(
        padding: EdgeInsets.only(top: 128),
        child: Container(
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColorLight),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      side: BorderSide(color: Colors.red)),
                ),
              ),
              child: Text(
                btnText,
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).primaryColorDark),
              ),
              onPressed: () {
                String userId = '';
                if (_isLogin) {
                  auth.login(txtUserName.text, txtPassword.text).then((value) {
                    if (value == null) {
                      setState(() {
                        _message = 'Login Error';
                      });
                    } else {
                      userId = value;
                      setState(() {
                        _message = 'User $userId successfully logged in';
                      });
                      changeScreen();
                    }
                  });
                } else {
                  auth
                      .createUser(txtUserName.text, txtPassword.text)
                      .then((value) {
                    if (value == null) {
                      setState(() {
                        _message = 'Registration Error';
                      });
                    } else {
                      userId = value;
                      setState(() {
                        _message = 'User $userId successfully signed in';
                      });
                    }
                  });
                }
              },
            )));
  }

  Widget btnSecondary() {
    String buttonText = _isLogin ? 'Sign up' : 'Log In';
    return TextButton(
      child: Text(buttonText),
      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
    );
  }

  Widget txtMessage() {
    return Text(
      _message,
      style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).primaryColorDark,
          fontWeight: FontWeight.bold),
    );
  }

  Widget btnGoogle() {
    return Padding(
        padding: EdgeInsets.only(top: 128),
        child: Container(
          height: 60,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColorLight),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: BorderSide(color: Colors.red)),
              ),
            ),
            onPressed: () {
              auth.loginWithGoogle().then((value) {
                if (value == null) {
                  setState(() {
                    _message = 'Google Login Error';
                  });
                } else {
                  setState(() {
                    _message = 'User $value successfully logged in with Google';
                  });
                  changeScreen();
                }
              });
            },
            child: Text(
              'Log in with Google',
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).primaryColorDark),
            ),
          ),
        ));
  }

  void changeScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UploadFileScreen()));
  }

 // Future _firebaseBackgroundMessageReceived(RemoteMessage message) async {
 //   print(
 //       "Notification: ${message.notification.title} - ${message.notification.body}");
 //  }
}
