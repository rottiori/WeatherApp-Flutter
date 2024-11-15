import 'package:intl/intl.dart';

class ClimaModel {
  final String pais;
  final String ciudad;
  final String hora;
  final String icon;
  final String descripcion;
  final double tempC;
  final String dia;

  ClimaModel({
    required this.pais,
    required this.ciudad,
    required this.hora,
    required this.icon,
    required this.descripcion,
    required this.tempC,
    required this.dia,
  });

  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    String localtime = json['location']['localtime'];
    DateTime dateTime = DateTime.parse(localtime);

    // Traducción de la descripción
    String descripcionEnIngles = json['current']['condition']['text'];
    String descripcionEnEspanol = _traducirDescripcion(descripcionEnIngles);

    return ClimaModel(
      pais: json['location']['country'],
      ciudad: json['location']['name'],
      hora: DateFormat('HH:mm').format(dateTime), // Solo hora en formato HH:MM
      icon: json['current']['condition']['icon'],
      descripcion: descripcionEnEspanol,
      tempC: json['current']['temp_c'],
      dia: _getDayOfWeek(dateTime.weekday), // Día en español
    );
  }

  static String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return "LUNES";
      case 2:
        return "MARTES";
      case 3:
        return "MIÉRCOLES";
      case 4:
        return "JUEVES";
      case 5:
        return "VIERNES";
      case 6:
        return "SÁBADO";
      case 7:
        return "DOMINGO";
      default:
        return "";
    }
  }

  // clima al español
  static String _traducirDescripcion(String descripcion) {
    switch (descripcion.toLowerCase()) {
      case 'sunny':
        return 'Soleado';
      case 'clear':
        return 'Despejado';
      case 'partly cloudy':
        return 'Parcialmente nublado';
      case 'cloudy':
        return 'Nublado';
      case 'overcast':
        return 'Cubierto';
      case 'mist':
        return 'Neblina';
      case 'rain':
        return 'Lluvia';
      case 'drizzle':
        return 'Llovizna';
      case 'thunderstorm':
        return 'Tormenta';
      case 'snow':
        return 'Nieve';
      case 'fog':
        return 'Niebla';
      case 'hail':
        return 'Granizo';
      default:
        return descripcion; // Retorna en inglés si no hay traducción
    }
  }
}
