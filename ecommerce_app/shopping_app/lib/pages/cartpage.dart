// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/CartTile.dart';
import 'package:shopping_app/model/cartmodel.dart';
import 'package:shopping_app/model/shoemodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => 
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Cart",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),

          const SizedBox(height: 10.0,),

          Expanded(child: ListView.builder(
            itemCount: value.getUserCart().length,
            itemBuilder: (context , index){
              //get individual shoe
              Shoe individualShoe = value.getUserCart()[index];

              return CartTile(
                shoe: individualShoe,
              );
            },
          ),
          ),
        ],
      ),
    ),);
  }
}