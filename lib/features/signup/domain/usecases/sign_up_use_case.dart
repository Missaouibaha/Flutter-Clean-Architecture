import 'package:clean_arch_app/core/networking/api_result.dart';
import 'package:clean_arch_app/features/signup/domain/entities/gender_enum.dart';
import 'package:clean_arch_app/features/signup/domain/entities/user.dart';
import 'package:clean_arch_app/features/signup/domain/repositpry/sign_up_repository.dart';

class SignUpUseCase {
  final SignUpRepository signUpRepository;
  SignUpUseCase(this.signUpRepository);

  Future<ApiResult<bool>> call(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
    String gender,
  ) async {
    return await signUpRepository.signUp(
      User(
        name,
        email,
        phone,
        password,
        confirmPassword,
        Gender.values.firstWhere((it) => it.genderName == gender).genderValue,
      ),
    );
  }
}
