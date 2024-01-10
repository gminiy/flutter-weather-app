import 'package:flutter_weather_app/data/dto/open_meteo_weather_response_dto.dart';
import 'package:flutter_weather_app/domain/model/hourly_weather_model.dart';
import 'package:flutter_weather_app/domain/model/weather_model.dart';
import 'package:flutter_weather_app/domain/model/weather_unit_model.dart';

extension HourlyModelMapper on OpenMeteoWeatherResponseDto {
  HourlyWeatherModel toHourlyWeatherModel() {
    final List<WeatherModel> weatherModels = [];
    final WeatherUnitModel weatherUnitModel = hourlyUnits == null
        ? const WeatherUnitModel(
            humidity: '%',
            pressure: 'hPa',
            temperature: '\u00B0C',
            windSpeed: 'km/h')
        : WeatherUnitModel(
            temperature: hourlyUnits!.temperature2m ?? '\u00B0C',
            humidity: hourlyUnits!.relativehumidity2m ?? '%',
            windSpeed: hourlyUnits!.windspeed10m ?? 'km/h',
            pressure: hourlyUnits!.pressureMsl ?? 'hPa');

    if (hourly == null || hourly?.time == null) {
      throw Exception('No Data');
    }

    for (int i = 0; i < hourly!.time!.length; i++) {
      weatherModels.add(WeatherModel(
          time: DateTime.parse(hourly!.time![i]),
          temperature: hourly!.temperature2m?[i] ?? 0,
          humidity: hourly!.relativehumidity2m?[i] ?? 0,
          windSpeed: hourly!.windspeed10m?[i] ?? 0,
          pressure: hourly!.pressureMsl?[i] ?? 0));
    }

    return HourlyWeatherModel(
        timezone: timezone ?? 'GMT',
        latitude: latitude ?? 0,
        longitude: longitude ?? 0,
        weatherUnitModel: weatherUnitModel,
        weatherModels: weatherModels);
  }
}
