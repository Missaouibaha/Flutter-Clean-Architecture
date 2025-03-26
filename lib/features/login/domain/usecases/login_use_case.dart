import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/login/domain/entities/user.dart';
import 'package:clean_arch_app/features/login/domain/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);

  Future<ApiResult<User>> call(String email, String password) async {
    final result = await loginRepository.login(email, password);
    return result.when(
      success: (response) {
        final user = User(
          token: response.userData?.token ?? '',
          name: response.userData?.name ?? '',
        );
        return ApiResult.success(user);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
