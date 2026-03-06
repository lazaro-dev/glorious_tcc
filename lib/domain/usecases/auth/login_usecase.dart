import 'package:glorious_tcc/data/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<bool> execute({
    required String username,
    required String password,
  }) async {
    return await _repository.login(
      username: username,
      password: password,
    );
  }
}
