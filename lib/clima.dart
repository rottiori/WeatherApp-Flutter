import 'package:flutter/material.dart';
import 'services/clima_service.dart';
import 'model/clima_model.dart';

class ClimaPage extends StatefulWidget {
  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  ClimaModel? _clima; // Modelo para almacenar datos del clima
  TextEditingController _controller =
      TextEditingController(); // Controlador para campo de texto

  // Función para obtener el clima
  Future<void> obtenerClima() async {
    try {
      String ciudad = _controller.text;
      var clima = await ClimaService().ClimaActual(ciudad);
      setState(() {
        _clima = clima;
      });
    } catch (e) {
      print("Error al obtener el clima: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeatherApp"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Ingrese la ciudad",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: obtenerClima,
              child: Text("Obtener clima"),
            ),
            SizedBox(height: 20),
            if (_clima != null) ...[
              Text(
                "Hora: ${_clima!.hora}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Image.network("https:${_clima!.icon}"),
              SizedBox(height: 10),
              Text(
                "Condición: ${_clima!.descripcion}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Temperatura: ${_clima!.tempC}°C",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
