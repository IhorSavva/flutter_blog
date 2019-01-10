import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    @required this.text,
    @required this.onPressed
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        onPressed: onPressed,
        textColor: Colors.white,
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          text,
        ));
  }
}