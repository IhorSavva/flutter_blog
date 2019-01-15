import 'package:blog/widgets/custom_flat_button.dart';
import 'package:blog/widgets/custom_raised_button.dart';
import 'package:blog/widgets/facebook_google_auth_block.dart';
import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:community_material_icon/community_material_icon.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _LoginScreenState extends State<LoginScreen> {
  Color gradientStart = Colors.white;
  Color gradientEnd = Colors.white30;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _LoginData _data = new _LoginData();

  bool isLoggedIn = false;

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  // Add validate password function.
  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }

  void initiateFacebookLogin() async {}

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      _auth.signInWithEmailAndPassword(
          email: _data.email, password: _data.password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        child: ListView(children: <Widget>[
          SizedBox(
            height: 75,
          ),
          Center(
            child: Text(
              'Blog',
              style: TextStyle(
                  fontFamily: 'LaserPlain',
                  fontSize: 55,
                  color: Colors.purple[500]),
            ),
          ),
          SizedBox(
            height: 75,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: new Form(
                key: this._formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                          validator: this._validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value) {
                            this._data.email = value;
                          },
                          decoration: new InputDecoration(
                              hintText: 'you@example.com',
                              labelText: 'E-mail Address')),
                      Stack(children: <Widget>[
                        TextFormField(
                            validator: this._validatePassword,
                            obscureText: true,
                            onSaved: (String value) {
                              this._data.password = value;
                            },
                            // Use secure text for passwords.
                            decoration: new InputDecoration(
                                hintText: 'Password',
                                labelText: 'Enter your password')),
                      ]),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomFlatButton(
                          text: 'Forgot password?',
                          onPressed: () => {},
                        ),
                      ),
                      CustomRaisedButton(
                          text: this.isLoggedIn ? "test" : 'LOGIN',
                          onPressed: this.initiateFacebookLogin),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black26))),
                                  width: 80.0,
                                ),
                                Padding(
                                    child: Text(
                                      'OR CONNECT WITH',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black45),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0)),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black26))),
                                  width: 80.0,
                                ),
                              ])),
                      FacebookGoogleAuthBlock()
                    ]),
              ))
        ]),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.05), BlendMode.dstATop),
            image: new AssetImage("assets/images/background-image.jpeg"),
            fit: BoxFit.cover,
          ),
          gradient: new LinearGradient(
              colors: [gradientStart, gradientEnd],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
    );
  }
}
