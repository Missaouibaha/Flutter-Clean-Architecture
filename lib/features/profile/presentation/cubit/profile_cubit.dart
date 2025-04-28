import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  ProfileCubit(this.getProfileUseCase) : super(ProfileState.initial());

  void emitProfilState() async {
    emit(ProfileState.loading());

    final response = await getProfileUseCase.call();

    response.when(
      success: (user) {
        emit(ProfileState.success(user));
      },
      failure: (error) {
        emit(
          ProfileState.error(
            error: error.apiErrorModel.message ?? AppStrings.unknownError,
          ),
        );
      },
    );
  }

  void resetLoading() {
    emit(ProfileState.initial());
  }
}
