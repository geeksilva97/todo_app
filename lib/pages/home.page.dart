import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.model.dart';
import 'package:todo_app/pages/nova_todo.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  List<Todo> todoList = new List<Todo>();

  void _mostraActionSheet(context){

    showModalBottomSheet(
      context: context,
      builder: (BuildContext actionSheetContext) {
        return NovaTodo(
          onAdd: (String titulo, String descricao) {
            print(titulo+' / '+descricao);
          },
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
              _mostraActionSheet(context);
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