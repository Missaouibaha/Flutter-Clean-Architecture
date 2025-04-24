import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_state.freezed.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState.initial() = _Initial;
}
