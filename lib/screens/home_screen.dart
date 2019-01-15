import 'package:blog/widgets/custom_outline_button.dart';
import 'package:blog/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color gradientStart = Colors.deepPurple[700];
  Color gradientEnd = Colors.purple[500];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: Column(children: <Widget>[
          Flexible(
              flex: 4,
              child: Center(
                child: Text(
                  'Blog',
                  style: TextStyle(
                      fontFamily: 'LaserPlain',
                      fontSize: 55,
                      color: Colors.white),
                ),
              )),
          Flexible(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CustomOutlineButton(text: 'SIGN UP', onPressed: ()=>Navigator.pushNamed(context, '/signup')),
                      CustomRaisedButton(text: 'LOGIN', onPressed: ()=>Navigator.pushNamed(context, '/login')),
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

