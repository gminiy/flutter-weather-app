import 'package:flutter_weather_app/domain/model/hourly_weather_model.dart';
import 'package:flutter_weather_app/domain/repository/hourly_weather_repository.dart';

class FetchAfterNowHourlyWeatherModelsUseCase {
  final HourlyWeatherRepository _hourlyWeatherRepository;

  const FetchAfterNowHourlyWeatherModelsUseCase({
    required HourlyWeatherRepository hourlyWeatherRepository,
  }) : _hourlyWeatherRepository = hourlyWeatherRepository;

  Future<HourlyWeatherModel> execute({
    required num latitude,
    required num longitude,
  }) async {
    final hourlyWeatherModel = await _hourlyWeatherRepository.getHourlyWeather(
      latitude: latitude,
      longitude: longitude,
    );

    final weatherModelsAfterNow = hourlyWeatherModel.weatherModels
        .where((e) => e.time.isAfter(DateTime.now()))
        .toList();

    return hourlyWeatherModel.copyWith(weatherModels: weatherModelsAfterNow);
  }
}
