// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/shoetile.dart';
import 'package:shopping_app/model/cartmodel.dart';
import 'package:shopping_app/model/shoemodel.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context,listen: false).addItemToCart(shoe);

    showDialog(context: context, builder:(context) => AlertDialog(
      title: Text("Shoe Successfully added."),
      content:Text("check your cart"),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            ),
            child:Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search",style: TextStyle(color: Colors.grey),),
                Icon(Icons.search,color: Colors.grey,),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("Everyone flies...Some fly longer than ohers!",style: TextStyle(color: Colors.grey),),
        ),



        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
             Text("Hot Picks🔥",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),),
          
              Text("See all",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.blue),),
            ],
          ),
        ),

        SizedBox(height: 10.0,),

        Expanded(                                             //shoe list
          child: ListView.builder(
          itemCount:5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
          
        //get the shoe from shop      //one by one..
        Shoe shoe = value.getShoeList()[index];
   
        return ShoeTile(            
          shoe:shoe,//data of shoe
          onTap:() => addShoeToCart(shoe),
        );
        }),
        ),

       Padding(
         padding: const EdgeInsets.only(top: 10.0 ,left:25.0,right: 25.0),
         child: Divider(color: Colors.white,),
       ) ,

      ],

    ),
    );
  }
}