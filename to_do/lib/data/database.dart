import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List todolist = [];

  //reference the box
final _mybox  =  Hive.box("mybox");


//run this method if this is the 1st time ever opening the app

void createInitialData(){

  List todolist = [
    
    ["read a book",false],
     ["do excercise",false],

  ];
}

//load data from database

void loadData(){
  todolist = _mybox.get("TODOLIST");
}

//update the database

void updateDataBase(){

  _mybox.put("TODOLIST", todolist);
}

}