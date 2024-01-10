import 'package:flutter_weather_app/domain/model/hourly_weather_model.dart';
import 'package:flutter_weather_app/domain/repository/hourly_weather_repository.dart';

class FetchHourlyUserUseCase {
  final HourlyWeatherRepository _hourlyWeatherRepository;

  const FetchHourlyUserUseCase({
    required HourlyWeatherRepository hourlyWeatherRepository,
  }) : _hourlyWeatherRepository = hourlyWeatherRepository;

  Future<HourlyWeatherModel> execute({
    required num latitude,
    required num longitude,
  }) async {
    return _hourlyWeatherRepository.getHourlyWeather(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
