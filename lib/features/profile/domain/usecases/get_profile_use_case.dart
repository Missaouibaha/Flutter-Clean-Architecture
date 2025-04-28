import 'package:clean_arch_app/core/helper/extensions.dart';
import 'package:clean_arch_app/core/networking/api_constants.dart';
import 'package:clean_arch_app/core/networking/api_error_handler.dart';
import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/profile/domain/entities/user.dart';
import 'package:clean_arch_app/features/profile/domain/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository profileRepository;
  GetProfileUseCase(this.profileRepository);

  Future<ApiResult<User>> call() async {
    final result = await profileRepository.getProfile();
    return result.when(
      success: (response) {
        return response.userData?.firstOrNull?.let(
              (data) => ApiResult.success(
                User(
                  name: data.name ?? "",
                  email: data.email ?? "",
                  phone: data.phone ?? "",
                  gender: data.gender ?? "",
                ),
              ),
            ) ??
            ApiResult.failure(ErrorHandler.handle(ApiErrors.noContent));
      },

      failure: (error) {
        return ApiResult.failure(error);
      },
    );
  }
}
