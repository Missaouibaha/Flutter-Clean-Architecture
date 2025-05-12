import 'package:clean_arch_app/features/home/domain/entities/user.dart';
import 'package:clean_arch_app/features/home/domain/repository/home_repository.dart';

class UserUseCase {
  final HomeRepository _homeRepository;
  UserUseCase(this._homeRepository);

  Future<User?> call() async {
    return await _homeRepository.getConnectedUser();
  }
}
