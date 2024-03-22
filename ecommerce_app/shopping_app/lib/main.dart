// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/cartmodel.dart';
import 'package:shopping_app/pages/intropage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(), //create new instance of cart class and provide it to other widgets..
      builder: (context,child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        ),
    );
  }
}