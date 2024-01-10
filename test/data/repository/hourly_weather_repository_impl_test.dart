import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/data/data_source/remote/open_meteo_api.dart';
import 'package:flutter_weather_app/data/repository/hourly_weather_repository_impl.dart';

void main() {
  test('HourlyWeatherRepositoryImpl test', () async {
    final api = OpenMeteoApi(dio: Dio());
    final repository = HourlyWeatherRepositoryImpl(api: api);
    final model = await repository.getHourlyWeather(latitude: 12, longitude: 12);
    
    expect(model.latitude.runtimeType, double);
  });
}