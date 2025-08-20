import 'package:flutter/material.dart';
import 'Controller/WeatherController.dart';
import 'Service/WeatherService.dart';
import 'Model/WeatherModel.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _cityController = TextEditingController();
  final WeatherController _controller = WeatherController(WeatherService());
  String? _weatherDescription;
  String? _weatherIcon;

  Future<void> _getWeather() async {
    final model = await _controller.getWeather(_cityController.text);
    setState(() {
      _weatherDescription = model == null
          ? 'Erro ao buscar clima'
          : 'Clima: ${model.description}\nTemperatura: ${model.temperature}°C\nForça do Vento: ${model.wind}';
      _weatherIcon = model == null ? null : 'Https:${model.icon}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consultar Clima')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'Digite o nome da cidade'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getWeather,
              child: const Text('Buscar Clima'),
            ),
            const SizedBox(height: 32),
            Text(
              _weatherDescription ?? 'Nenhuma informação carregada',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
              if (_weatherIcon != null)
                Image.network(
                  _weatherIcon!,
                  width: 100,
                  height: 100,
                ),
          ],
        ),
      ),
    );
  }
}
