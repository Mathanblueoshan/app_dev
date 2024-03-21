// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/homepage.dart';

void main() async{
 //init hive (database)
 await Hive.initFlutter();

 //open a box
 var box = await Hive.openBox("mybox");


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.purple,),
    );
  }
}