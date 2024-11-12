import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/clima_model.dart';

class ClimaService {
  final String apiKey = "b784f577eeff4864a3b213907241111"; // API Key

  // Función para obtener el clima actual por ciudad
  Future<ClimaModel> ClimaActual(String ciudad) async {
    final url = Uri.parse(
      "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$ciudad",
    );

    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      final jsonData = json.decode(respuesta.body);
      return ClimaModel.fromJson(jsonData);
    } else {
      throw Exception("Error al obtener datos del clima");
    }
  }
}
