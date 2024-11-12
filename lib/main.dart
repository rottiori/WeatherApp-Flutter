import 'package:flutter/material.dart';
import 'clima.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: Clima.routeName,
      routes: {
        Clima.routeName: (context) => const Clima(),
      },
    );
  }
}
