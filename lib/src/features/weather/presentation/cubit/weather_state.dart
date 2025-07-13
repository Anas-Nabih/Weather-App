part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherResult weatherResult;

  const WeatherSuccess(this.weatherResult);

  @override
  List<Object> get props => [weatherResult];
}

class WeatherFailure extends WeatherState {
  final Failure failure;

  const WeatherFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
