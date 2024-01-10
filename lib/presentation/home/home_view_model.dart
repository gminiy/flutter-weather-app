import 'package:flutter/widgets.dart';
import 'package:flutter_weather_app/domain/model/hourly_weather_model.dart';
import 'package:flutter_weather_app/domain/model/weather_model.dart';
import 'package:flutter_weather_app/domain/use_case/fetch_hourly_weather_use_case.dart';
import 'package:flutter_weather_app/presentation/home/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  HomeState _state = const HomeState();
  final FetchHourlyUserUseCase _fetchHourlyUserUseCase;

  HomeState get state => _state;

  HomeViewModel({
    required FetchHourlyUserUseCase fetchHourlyUserUseCase,
  }) : _fetchHourlyUserUseCase = fetchHourlyUserUseCase;

  Future<void> fetchHourlyWeather() async {
    final HourlyWeatherModel hourlyWeatherModel =
        await _fetchHourlyUserUseCase.execute(latitude: 12, longitude: 12);
    final List<DateTime> timeList = [];
    final List<num> temperatureList = [];
    final List<num> humidityList = [];
    final List<num> windSpeedList = [];
    final List<num> pressureList = [];

    for (WeatherModel weatherModel in hourlyWeatherModel.weatherModels) {
      timeList.add(weatherModel.time);
      temperatureList.add(weatherModel.temperature);
      humidityList.add(weatherModel.humidity);
      windSpeedList.add(weatherModel.windSpeed);
      pressureList.add(weatherModel.pressure);
    }

    _state = _state.copyWith(
      humidityList: humidityList,
      pressureList: pressureList,
      temperatureList: temperatureList,
      timeList: timeList,
      windSpeedList: windSpeedList,
    );
    notifyListeners();
  }
}
