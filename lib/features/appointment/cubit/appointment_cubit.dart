import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/features/appointment/cubit/appointment_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentState.initial());
}
