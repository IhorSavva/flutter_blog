import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    @required this.text,
    @required this.onPressed
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        onPressed: onPressed,
        textColor: Colors.deepPurple[700],
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          text,
        ));
  }
}