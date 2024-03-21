// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_app/data/database.dart';
import 'package:to_do_list_app/util/createbox.dart';
import 'package:to_do_list_app/util/todolisttile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


//reference the box
final _mybox  =  Hive.box("mybox");

//create instance of database class
final ToDoDatabase db = ToDoDatabase();


  final _controller = TextEditingController();

@override
  void initState() {
    super.initState();

//initial database data
if(_mybox.get("TODOLIST") == null){

   // default data
  db.createInitialData();
}else{
  //there already exist data
  db.loadData();
}

  }

//checkbox function
void checkboxChanged(bool? value ,int index){
  setState(() {
    db.todolist[index][1] = ! db.todolist[index][1];
  });

 db.updateDataBase(); //update database

}

//save 
void saveNewTask(){
  
  setState(() {
    db.todolist.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();

  db.updateDataBase();   //update database
}

//create box
void createTask(){
  showDialog(context: context, builder: (context){
          
          return CreateBox(
            titlecontroller: _controller,
            onSave: saveNewTask,
            onCancel:()  => Navigator.of(context).pop(),
          );

  });
}

//delete task
void deleteTask(index){
  setState(() {
    db.todolist.removeAt(index);
  });
  db.updateDataBase(); //update database
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("TO DO LIST",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),

      body: ListView.builder(
        itemCount:db.todolist.length,
        itemBuilder: (context, index) {
          return ToDoListTile(taskname: db.todolist[index][0],
           taskcompleted: db.todolist[index][1], 
           onChanged: (value) => checkboxChanged(value,index),
           deleteFunction: (context) => deleteTask(index),
           );
        },
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: (){
            createTask();
          },
        child: Icon(Icons.add),),
       
    );
  }
}
