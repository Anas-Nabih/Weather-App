import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/src/core/exceptions/failure.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_params.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_result.dart';
import 'package:weather_app/src/features/weather/domain/usecases/weather_usecase.dart';

part 'weather_state.dart';

///  ️ Weather Cubit: Handles business logic and emits UI states (loading, success, failure).
@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitial());

  WeatherParams params = WeatherParams();

  Future<void> fetchWeather() async {
    emit(WeatherLoading());

    final result = await getWeatherUseCase(params);

    result.fold(
      (failure) => emit(WeatherFailure(failure)),
      (weather) => emit(WeatherSuccess(weather)),
    );
  }

  void setCity(String city) {
    params = params.copyWith(city: city);
  }
}
