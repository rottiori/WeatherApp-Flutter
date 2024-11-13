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

    return ClimaModel(
      pais: json['location']['country'],
      ciudad: json['location']['name'],
      hora: DateFormat('HH:mm').format(dateTime), // Solo hora en formato HH:MM
      icon: json['current']['condition']['icon'],
      descripcion: json['current']['condition']['text'],
      tempC: json['current']['temp_c'],
      dia: _getDayOfWeek(dateTime.weekday), // Día en español
    );
  }

  static String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return "Lunes";
      case 2:
        return "Martes";
      case 3:
        return "Miércoles";
      case 4:
        return "Jueves";
      case 5:
        return "Viernes";
      case 6:
        return "Sábado";
      case 7:
        return "Domingo";
      default:
        return "";
    }
  }
}
