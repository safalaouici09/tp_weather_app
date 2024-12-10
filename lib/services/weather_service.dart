import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  final String apiKey = "cdeb2925e2e66901e6e92c321a379310";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<WeatherModel>? fetchWeather(String city) async {
    final url = Uri.parse("$baseUrl?q=$city&appid=$apiKey&units=metric");
    final response = await http.get(url);
    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("Erreur lors de la récupération des données météo");
    }
  }
}
