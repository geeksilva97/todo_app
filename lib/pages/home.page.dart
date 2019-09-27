import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  List<Todo> _todoList = new List<Todo>();
  final TextEditingController _controllerDescricao = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _addTarefa(context){
    showDialog(
      context: context,
      builder: (BuildContext c) {
        return AlertDialog(
          actions: <Widget>[
            FlatButton(
              child: Text('CANCELAR', style: TextStyle(color: Colors.grey),),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),

            FlatButton(
              child: Text('ADICIONAR'),
              onPressed: (){
                if(_controllerDescricao.text.isNotEmpty) {
                  int id = DateTime.now().millisecond;
                  setState(() {
                    _todoList.add(Todo(
                      id: id,
                      descricao: _controllerDescricao.text
                    ));
                  });

                  _controllerDescricao.clear();
                  Navigator.of(context).pop();
                }
              },
            )
          ],
          title: Text('NOVA TAREFA'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  focusNode: _focusNode,
                  controller: _controllerDescricao,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    // border: OutlineInputBorder()
                  ),
                ),

                SizedBox(height: 10.0,),

              ],
            ),
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
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {

          Todo todo = _todoList[index];

          return Dismissible(
            key: ValueKey(todo.id),
            onDismissed: (direction) {
              setState(() {
                _todoList.removeAt(index);
              });
            },
            background: Card(
              elevation: 4.0,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(4.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.delete, color: Colors.white)
                ),
              ),
            ),
            direction: DismissDirection.endToStart,
            child: Card(
              elevation: 4.0,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text(todo.descricao),
                  trailing: Icon(Icons.swap_horizontal_circle),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}