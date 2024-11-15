import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'services/clima_service.dart';
import 'model/clima_model.dart';

class ClimaPage extends StatefulWidget {
  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  ClimaModel? _clima;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _obtenerUbicacionYClima();
  }

  Future<void> _obtenerUbicacionYClima() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      String ciudad = "${position.latitude},${position.longitude}";
      var clima = await ClimaService().ClimaActual(ciudad);
      setState(() {
        _clima = clima;
      });
    } catch (e) {
      print("Error al obtener la ubicación: $e");
    }
  }

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
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Barra de búsqueda rediseñada
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Buscar ciudad",
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Botón para obtener el clima
              ElevatedButton(
                onPressed: obtenerClima,
                child: Text("Obtener clima"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
              ),
              SizedBox(height: 20),

              // Muestra la información del clima solo si está disponible
              if (_clima != null) ...[
                // País y ciudad
                Text(
                  "${_clima!.pais}, ${_clima!.ciudad}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Icono del clima
                Image.network(
                  "https:${_clima!.icon}",
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),

                // Descripción del clima (en español)
                Text(
                  _clima!.descripcion,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),

                // Temperatura
                Text(
                  "${_clima!.tempC}°",
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),

                // Hora y día
                Text(
                  "${_clima!.hora}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${_clima!.dia}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
