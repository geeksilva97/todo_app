import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.model.dart';

class NovaTodo extends StatelessWidget {

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final Function(String t, String d) onAdd;

  NovaTodo({ this.onAdd });


  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        children: <Widget>[
          TextFormField(
            controller: _tituloController,
            decoration: InputDecoration(
              labelText: 'Título',
              border: OutlineInputBorder()
            ),
          ),

          SizedBox(height: 10,),

          TextFormField(
            controller: _descricaoController,
            decoration: InputDecoration(
              labelText: 'Descrição',
              border: OutlineInputBorder()
            ),
          ),

          SizedBox(height: 15,),

          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: RaisedButton(
                    child: Text('Adicionar', style: TextStyle(fontSize: 18.0),),
                    onPressed: () => onAdd(_tituloController.text, _descricaoController.text),
                  ),
                ),
              )
            ],
          )
        ],
      );
  }


  void addTarefa(BuildContext context) {
    if(_tituloController.text.isNotEmpty && _tituloController.text.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed('/', arguments: Todo(titulo: _tituloController.text, descricao: _descricaoController.text));
    }
  }
}