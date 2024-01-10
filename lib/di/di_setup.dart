import 'package:flutter_weather_app/data/data_source/remote/open_meteo_api.dart';
import 'package:flutter_weather_app/data/repository/hourly_weather_repository_impl.dart';
import 'package:flutter_weather_app/domain/repository/hourly_weather_repository.dart';
import 'package:flutter_weather_app/domain/use_case/fetch_after_now_hourly_weather_models_use_case.dart';
import 'package:flutter_weather_app/presentation/home/home_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<OpenMeteoApi>(OpenMeteoApi(dio: getIt()));
  getIt.registerSingleton<HourlyWeatherRepository>(
      HourlyWeatherRepositoryImpl(api: getIt()));
  getIt.registerSingleton<FetchAfterNowHourlyWeatherModelsUseCase>(
      FetchAfterNowHourlyWeatherModelsUseCase(
          hourlyWeatherRepository: getIt()));

  getIt.registerFactory(() => HomeViewModel(
      fetchAfterNowHourlyWeatherModelsUseCase:
          getIt<FetchAfterNowHourlyWeatherModelsUseCase>()));
}
