import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/WeatherModel.dart';

class WeatherService {
  final String apiKey = '5cbd0ac4acaf47b98b8233136252102';

  Future<WeatherModel> fetchWeather(String city) async {
    final url = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no&lang=pt_BR'
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Erro ao buscar clima');
    }
  }
}
