import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/src/core/exceptions/exceptions.dart';
import 'package:weather_app/src/core/exceptions/failure.dart';
 import 'package:weather_app/src/core/network/network_info.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_local_data_source.dart';
import 'package:weather_app/src/features/weather/data/datasource/weather_remote_data_source.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_params.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_result.dart';
import 'package:weather_app/src/features/weather/domain/repositories/weather_repository.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDataSource _source;
  final WeatherLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  WeatherRepositoryImpl(this._source, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, WeatherResult>> getWeather(
    WeatherParams params,
  ) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      final cached = await _localDataSource.getCachedWeather();
      if (cached != null) {
        return Right(
          WeatherResult(weather: cached, isCached: true, hasNetworkError: true),
        );
      }
      return Left(NetworkFailure());
    }

    try {
      final result = await _source.getWeather(params);
      await _localDataSource.cacheWeather(result);
      return Right(WeatherResult(weather: result));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          messageArray: e.errors,
          statusCode: e.statusCode,
        ),
      );
    } catch (_) {
      return Left(Failure(message: "Some Thing Wrong Happened"));
    }
  }
}
