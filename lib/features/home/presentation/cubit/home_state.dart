import 'package:clean_arch_app/features/home/presentation/cubit/comined_data.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(CombinedData data) = _Initial;
  const factory HomeState.homeLoading(CombinedData data) = HomeLoading;
  const factory HomeState.homeLoaded(CombinedData data) = HomeLoaded;
  const factory HomeState.homeError(String error, CombinedData data) =
      HomeError;
}
