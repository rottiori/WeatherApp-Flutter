import 'package:flutter/material.dart';
import 'services/clima_service.dart';
import 'model/clima_model.dart';

class ClimaPage extends StatefulWidget {
  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  ClimaModel? _clima;
  TextEditingController _controller = TextEditingController();

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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: obtenerClima,
                child: Text("Obtener clima"),
              ),
              SizedBox(height: 20),
              if (_clima != null) ...[
                Text(
                  "${_clima!.pais}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Image.network(
                  "https:${_clima!.icon}",
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  "${_clima!.tempC}°",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.w300),
                ),
                Text(
                  "${_clima!.ciudad}",
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),
                SizedBox(height: 20),
                Text(
                  "${_clima!.hora}", // Hora en formato HH:MM
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                Text(
                  "${_clima!.dia}", // Día en español
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
