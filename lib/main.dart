import 'package:flutter/material.dart';
import 'clima.dart'; // Importamos el archivo clima.dart

void main() {
  runApp(MyApp()); // Iniciamos la app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClimaPage(), //  página principal
    );
  }
}
