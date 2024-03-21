// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoListTile extends StatelessWidget {

  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  


  const ToDoListTile({super.key, required this.taskname, required this.taskcompleted, this.onChanged, this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(onPressed: deleteFunction,
        icon:Icons.delete_outline,
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(20.0),
        ),
        ]),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)
            
          ),
          
          child: Row(
           children: [
        
           Checkbox(value: taskcompleted, onChanged: onChanged,
           activeColor:Colors.lightGreen,),
        
            Text(taskname,style: TextStyle(
              fontSize: 20.0,
              
             
              decoration: taskcompleted ? TextDecoration.lineThrough
              :TextDecoration.none
              ),),
           ],
          ),
        ),
      ),
    );
  }
}