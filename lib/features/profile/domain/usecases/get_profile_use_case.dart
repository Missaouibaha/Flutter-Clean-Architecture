import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/core/networking/default_error.dart';
import 'package:clean_arch_app/features/profile/domain/entities/user.dart';
import 'package:clean_arch_app/features/profile/domain/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository profileRepository;
  GetProfileUseCase(this.profileRepository);

  Future<ApiResult<User>> call() async {
    final result = await profileRepository.getProfile();
    return result.when(
      success:
          (response) =>
              response.userData?[0].let(
                (userData) => ApiResult.success(
                  User(
                    name: userData.name ?? "",
                    email: userData.email ?? "",
                    phone: userData.phone ?? "",
                    gender: userData.gender ?? "",
                  ),
                ),
              ) ??
              ApiResult.failure(
                ErrorHandler.handle(DefaultError("User data is null")),
              ),

      failure: (error) {
        print("eeee : ${error.apiErrorModel.message} ");

        return ApiResult.failure(error);
      },
    );
  }
}
