// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
 
  final String text;
 final VoidCallback onPressed;
 const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.purple,
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white),),
    );
  }
}