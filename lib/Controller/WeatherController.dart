import '../Model/WeatherModel.dart';
import '../Service/WeatherService.dart';

class WeatherController {
  final WeatherService _service;

  WeatherController(this._service);

  Future<WeatherModel?> getWeather(String city) async {
    if (city.trim().isEmpty) return null;
    try {
      return await _service.fetchWeather(city);
    } catch (e) {
      return null;
    }
  }
}
