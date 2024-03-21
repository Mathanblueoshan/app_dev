// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_list_app/util/buttons.dart';


class CreateBox extends StatelessWidget {
  final titlecontroller;
  final VoidCallback onSave;
 final  VoidCallback onCancel;

  const CreateBox({super.key, required this.titlecontroller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      title: Padding(
        padding: const EdgeInsets.only(left:50.0),
        child: Text("Create Task",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
     backgroundColor: Colors.white,
     content: Container(
      height: 150,
       
       //user input
      child: Column(
        children: [
          TextField(
            controller:titlecontroller,
            decoration: InputDecoration(
              hintText: "add a new task",
              border: OutlineInputBorder(),
          
            ),
          ),
        SizedBox(height: 8.0,),
          
          //save and cancel buttons..
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             MyButton(text: "save", onPressed:onSave),

             SizedBox(width: 8.0,),

               MyButton(text: "cancel", onPressed: onCancel),
           ],
         ),

        


        ],
      ),


     ),
    );
  }
}