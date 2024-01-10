import 'package:dio/dio.dart';

class OpenMeteoApi {
  final Dio _dio;

  const OpenMeteoApi({
    required Dio dio,
  }) : _dio = dio;

  Future<Map<String, dynamic>> getHourlyWeather({
    required num latitude,
    required num longitude,
  }) async {
    final String url =
        'https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,weathercode,relativehumidity_2m,windspeed_10m,pressure_msl&latitude=$latitude&longitude=$longitude';
    final response = await _dio.get(url);

    return response.data;
  }
}
