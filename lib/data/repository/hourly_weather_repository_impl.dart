import 'package:flutter_weather_app/data/data_source/remote/open_meteo_api.dart';
import 'package:flutter_weather_app/data/dto/open_meteo_weather_response_dto.dart';
import 'package:flutter_weather_app/data/mapper/hourly_weather_model_mapper.dart';
import 'package:flutter_weather_app/domain/model/hourly_weather_model.dart';
import 'package:flutter_weather_app/domain/repository/hourly_weather_repository.dart';

class HourlyWeatherRepositoryImpl implements HourlyWeatherRepository {
  final OpenMeteoApi _api;

  const HourlyWeatherRepositoryImpl({
    required OpenMeteoApi api,
  }) : _api = api;

  @override
  Future<HourlyWeatherModel> getHourlyWeather({
    required int latitude,
    required int longitude,
  }) async {
    final response =
        await _api.getHourlyWeather(latitude: latitude, longitude: longitude);

    return (OpenMeteoWeatherResponseDto.fromJson(response))
        .toHourlyWeatherModel();
  }
}
