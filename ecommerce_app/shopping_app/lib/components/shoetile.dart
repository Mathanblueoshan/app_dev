// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/model/shoemodel.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(shoe.imagePath),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Text(
              textAlign: TextAlign.center,
              shoe.description,
              style: TextStyle(color: Colors.grey,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                 
                  children: [
                    Text(shoe.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text('\$'+shoe.price,style: TextStyle(color: Colors.grey)),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,//add cart function
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Icon(Icons.add,color: Colors.white,),
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
