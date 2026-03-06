import 'package:glorious_tcc/data/repositories/auth_repository.dart';

class AuthService {
  final AuthRepository repository;

  AuthService(this.repository);

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    return await repository.login(
      username: username,
      password: password,
    );
  }

  Future<bool> isLogged() async {
    return await repository.isLogged();
  }

  Future<bool> logout() async {
    return await repository.logout();
  }
}
