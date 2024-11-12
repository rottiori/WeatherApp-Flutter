import 'package:http/http.dart' as http;

class ClimaService {
  String baseUrl = 'https://api.weatherapi.com/v1';

  Future ClimaActual(String key, String ciudad) async {
    var url = Uri.https('$baseUrl/current.json?key=$key&q=$ciudad&lang=es');
    var response = await http.post(url);
    print('Response status: ${response.statusCode}');
  }
}
