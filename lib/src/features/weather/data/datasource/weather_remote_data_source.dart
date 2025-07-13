import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/src/core/exceptions/exceptions.dart';
import 'package:weather_app/src/core/services/network_service.dart';
import 'package:weather_app/src/features/weather/data/models/weather_model.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_params.dart';

/// Defines the contract for remote API operations.
abstract class WeatherDataSource {
  Future<WeatherModel> getWeather(WeatherParams params);
}

@Injectable(as: WeatherDataSource)
class WeatherDataSourceImpl extends WeatherDataSource {
  final NetworkService _service;

  WeatherDataSourceImpl(this._service);

  @override
  Future<WeatherModel> getWeather(WeatherParams params) async {
    try {
      final response = await _service.get(
        path: '/current.json',
        queryParameters: {
          'key': '6f27a7b9512c4882a45162444252101',
          'q': params.city,
        },
      );

      if (response.statusCode == 200 && response.data?["location"] != null) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException(
          error: response.data?["error"]["data"]["message"],
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;

      final errorMessage = data?['error']?['message'] ?? 'Unknown error';
      final errorCode = data?['error']?['code'] ?? 500;

      throw ServerException(
        error: errorMessage,
        statusCode: errorCode,
        errors: data,
      );
    }
  }
}
