import 'package:flutter_weather_app/domain/model/hourly_weather_model.dart';

abstract interface class HourlyWeatherRepository {
  Future<HourlyWeatherModel> getHourlyWeather({
    required num latitude,
    required num longitude,
  });
}
