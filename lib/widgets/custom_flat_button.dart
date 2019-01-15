import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    @required this.text,
    @required this.onPressed
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        textColor: Colors.deepPurple[700],
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          text,
        ));
  }
}