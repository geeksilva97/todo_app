import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.page.dart';

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Meu primeiro app',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // routes: {
      //   '/': (context) => HomePage()
      // },
      home: HomePage(),
    );
  }
}