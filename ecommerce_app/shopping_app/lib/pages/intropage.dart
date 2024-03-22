// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';

import 'package:shopping_app/pages/homepage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Image.asset(
              "lib/images/nike.png",
              width:300,
              height: 340,
            ),

            const SizedBox(
              height: 48,
            ),
            //title

            Text(
              "N I K E",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),

          

            //sub
            const SizedBox(
              height: 24,
            ),

            Text(
              "Brand new Sneakers and Custom Kicks made with Premium Quality",
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

             const SizedBox(
              height: 48,
            ),

            GestureDetector(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage(),),);},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Shop Now",style:TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
