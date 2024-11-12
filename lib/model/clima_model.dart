class ClimaModel {
  final String hora;
  final String icon;
  final String descripcion;
  final double tempC;

  ClimaModel({
    required this.hora,
    required this.icon,
    required this.descripcion,
    required this.tempC,
  });

  // Método para crear una instancia del modelo a partir de JSON
  factory ClimaModel.fromJson(Map<String, dynamic> json) {
    return ClimaModel(
      hora: json['location']['localtime'],
      icon: json['current']['condition']['icon'],
      descripcion: json['current']['condition']['text'],
      tempC: json['current']['temp_c'],
    );
  }
}
