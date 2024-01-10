import 'package:flutter_weather_app/domain/model/weather_model.dart';
import 'package:flutter_weather_app/domain/model/weather_unit_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'hourly_weather_model.freezed.dart';

part 'hourly_weather_model.g.dart';

@freezed
class HourlyWeatherModel with _$HourlyWeatherModel {
  const factory HourlyWeatherModel({
    required final String timezone,
    required final num latitude,
    required final num longitude,
    required final WeatherUnitModel weatherUnitModel,
    required final WeatherModel weatherModel,
  }) = _HourlyWeatherModel;

  factory HourlyWeatherModel.fromJson(Map<String, Object?> json) => _$HourlyWeatherModelFromJson(json);
}