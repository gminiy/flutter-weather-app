import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'weather_unit_model.freezed.dart';

part 'weather_unit_model.g.dart';

@freezed
class WeatherUnitModel with _$WeatherUnitModel {
  const factory WeatherUnitModel({
    required final String temperature,
    required final String humidity,
    required final String windSpeed,
    required final String pressure,
  }) = _WeatherUnitModel;

  factory WeatherUnitModel.fromJson(Map<String, Object?> json) =>
      _$WeatherUnitModelFromJson(json);
}
