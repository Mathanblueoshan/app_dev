// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopping_app/components/bottomnavbar.dart';
import 'package:shopping_app/pages/cartpage.dart';
import 'package:shopping_app/pages/shoppage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void NavigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyButtomNavBar(
        onTabChange: (index) => NavigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(Icons.menu),
            ),
          ),
        ),
      ),



      //drawer-----------------------------------------------------------------------


      drawer: Drawer(
        backgroundColor: Colors.black,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
          Column(children: [
              DrawerHeader(child:Image.asset("lib/images/nike.png",color: Colors.white,),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home,color: Colors.white,),
                title: Text("Home",style: TextStyle(color: Colors.white,),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info,color: Colors.white,),
                title: Text("About",style: TextStyle(color: Colors.white,),),
              ),
            ),
          ],),


             Padding(
              padding: const EdgeInsets.only(left: 25.0,bottom: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout,color: Colors.white,),
                title: Text("Logout",style: TextStyle(color: Colors.white,),),
              ),
            ),
          ],
        ),
      ),




      body: pages[_selectedIndex],
    );
  }
}
