import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/setting/domain/usecases/setting_use_case.dart';
import 'package:clean_arch_app/features/setting/presentation/cubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  final SettingUseCase settingUseCase;
  SettingCubit(this.settingUseCase) : super(SettingState.initial());

  void emitSettingLogoutStates() async {
    emit(SettingState.loading());
    final result = await settingUseCase.call();
    result.when(
      success: (data) => emit(SettingState.success()),

      failure:
          (error) => emit(
            SettingState.error(
              error: error.apiErrorModel.message ?? AppStrings.unknownError,
            ),
          ),
    );
  }
}
