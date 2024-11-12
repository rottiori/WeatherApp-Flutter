import 'package:flutter/material.dart';

class Clima extends StatelessWidget {
  static const String routeName = '/clima'; // Define la ruta aquí
  const Clima({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'País',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Icon(
                Icons.wb_sunny, // Icono simplificado de clima
                size: 80,
                color: Colors.yellow[700],
              ),
              Text(
                '32°', // Valor de temperatura
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Ciudad',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Column(
                children: [
                  Text(
                    '12:01 P.M',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'MONDAY', // Día de la semana
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
