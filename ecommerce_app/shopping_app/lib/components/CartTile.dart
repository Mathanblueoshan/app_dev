// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/cartmodel.dart';
import 'package:shopping_app/model/shoemodel.dart';

class CartTile extends StatefulWidget {
  
    Shoe shoe;
   CartTile({super.key, required this.shoe,});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {

  void removeItemFromCart(){
    Provider.of<Cart>(context,listen: false).removeItemFromCart(widget.shoe);
  }
  @override
  Widget build(BuildContext context) {
   
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[100],
      ),
      margin: EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle:Text(widget.shoe.price),

        trailing: IconButton(onPressed:removeItemFromCart, icon: Icon(Icons.delete),),
      ),
    );
  }
}