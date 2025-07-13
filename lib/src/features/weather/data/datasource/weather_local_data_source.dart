import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:weather_app/src/core/services/local_storage_service.dart';
import 'package:weather_app/src/features/weather/data/models/weather_model.dart';

///  Defines the contract for local data operations (e.g., cache weather).
abstract class WeatherLocalDataSource {
  Future<void> cacheWeather(WeatherModel weather);

  Future<WeatherModel?> getCachedWeather();
}

const cachedWeatherKey = 'CACHED_WEATHER';

@Injectable(as: WeatherLocalDataSource)
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final LocalStorageService _localStorage;

  WeatherLocalDataSourceImpl(@Named("shared_preferences") this._localStorage);

  final String cachedWeatherKey = "CACHED_WEATHER";

  @override
  Future<void> cacheWeather(WeatherModel weather) async {
    final jsonString = jsonEncode(weather.toJson());
    await _localStorage.setData(cachedWeatherKey, jsonString);
  }

  @override
  Future<WeatherModel?> getCachedWeather() async {
    final jsonString = await _localStorage.getData<String>(cachedWeatherKey);
    if (jsonString != null) {
      return WeatherModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
