import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() {
  // Mantém o app funcionando sempre na vertical
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(TodoApp());
}