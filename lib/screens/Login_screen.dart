import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color gradientStart = Colors.white;
  Color gradientEnd = Colors.white30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body:  Container(
        child: Column(children: <Widget>[
          Flexible(
              flex: 2,
              child: Center(
                child: Text(
                  'Blog',
                  style: TextStyle(
                      fontFamily: 'LaserPlain',
                      fontSize: 55,
                      color: Colors.purple[500]),
                ),
              )),
          Flexible(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CustomRaisedButton(),
                    ],
                  )))
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

class CustomOutlineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        onPressed: () => {},
        textColor: Colors.white,
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          "SIGN UP",
        ));
  }
}

class CustomRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        onPressed: () => {},
        textColor: Colors.deepPurple[700],
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          "LOGIN",
        ));
  }
}
