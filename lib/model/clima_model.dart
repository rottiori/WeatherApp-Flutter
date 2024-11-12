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

  // Método para crear una instancia del modelo a partir de JSON
  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    // Extraer la fecha y hora para determinar el día de la semana
    String localtime = json['location']['localtime'];
    DateTime dateTime = DateTime.parse(localtime);

    return ClimaModel(
      pais: json['location']['country'],
      ciudad: json['location']['name'],
      hora: localtime,
      icon: json['current']['condition']['icon'],
      descripcion: json['current']['condition']['text'],
      tempC: json['current']['temp_c'],
      dia: _getDayOfWeek(dateTime.weekday), // Asignar el día de la semana
    );
  }

  // Método auxiliar para convertir el número de día en nombre de día
  static String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return "MONDAY";
      case 2:
        return "TUESDAY";
      case 3:
        return "WEDNESDAY";
      case 4:
        return "THURSDAY";
      case 5:
        return "FRIDAY";
      case 6:
        return "SATURDAY";
      case 7:
        return "SUNDAY";
      default:
        return "";
    }
  }
}
