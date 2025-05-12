import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/profile/domain/entities/user.dart';
import 'package:clean_arch_app/features/profile/domain/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository profileRepository;
  GetProfileUseCase(this.profileRepository);

  Future<ApiResult<User>> call() async {
    return await profileRepository.getProfile();
  }
}
