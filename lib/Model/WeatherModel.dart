class WeatherModel {
  final String description;
  final double temperature;
  final String icon;
  final double wind;

  WeatherModel({required this.description, required this.temperature, required this.icon, required this.wind});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['current']['condition']['text'],
      temperature: json['current']['temp_c'],
      icon: json['current']['condition']['icon'],
      wind: json['current']['condition']['gust_kph'],
    );
  }
}
