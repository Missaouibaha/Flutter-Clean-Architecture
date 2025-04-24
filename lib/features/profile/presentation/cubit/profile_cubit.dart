import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:clean_arch_app/features/profile/domain/entities/user.dart';
import 'package:clean_arch_app/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:clean_arch_app/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  ProfileCubit(this.getProfileUseCase) : super(ProfileState.initial());

  late User? user;
  void emitProfilState() async {
    emit(ProfileState.loading());

    final response = await getProfileUseCase.call();

    response.when(
      success: (user) {
        this.user = user;
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
}
