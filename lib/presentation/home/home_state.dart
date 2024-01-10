import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<DateTime> timeList,
    @Default([]) List<num> temperatureList,
    @Default([]) List<num> humidityList,
    @Default([]) List<num> windSpeedList,
    @Default([]) List<num> pressureList,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, Object?> json) =>
      _$HomeStateFromJson(json);
}
