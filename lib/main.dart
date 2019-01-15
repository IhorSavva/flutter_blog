import 'dart:convert';
import 'package:blog/screens/home_screen.dart';
import 'package:blog/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:blog/screens/login_screen.dart';

void main() async {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp(
      {Key key})
      : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.purple[500],
          accentColor: Colors.white,
        ),
      title: 'Blog',
      home: HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(
                builder: (_) => HomeScreen(),
                settings: settings
            );
          case '/login':
            return MaterialPageRoute(
                builder: (_) => LoginScreen(),
                settings: settings
            );
          case '/signup':
            return MaterialPageRoute(
                builder: (_) => SignupScreen(),
                settings: settings
            );
        }
      },
    );
  }
}
