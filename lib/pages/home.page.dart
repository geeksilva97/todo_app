import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.model.dart';
import 'package:todo_app/pages/nova_todo.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  List<Todo> todoList = new List<Todo>();

  void _addTarefa(context){
    showDialog(
      context: context,
      builder: (BuildContext c) {
        return AlertDialog(
          title: Text('NOVA TAREFA'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição da tarefa',
                  border: OutlineInputBorder()
                ),
              )
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: (){
              _addTarefa(context);
              // _mostraActionSheet(context);
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NovaTodo()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(index),
            child: ListTile(
              title: Text('testando'),
            ),
          );
        },
      ),
    );
  }
}