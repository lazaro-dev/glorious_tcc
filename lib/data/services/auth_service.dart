import 'package:glorious_tcc/data/repositories/user_repository.dart';
import 'package:glorious_tcc/data/services/password_hasher.dart';
import 'package:glorious_tcc/data/services/session_service.dart';

class AuthService {
  final UserRepository repository;
  final SessionService sessionService;

  AuthService(this.repository, this.sessionService);

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final user = await repository.findByEmail(
      username,
    );

    if (user == null) return false;

    if (!PasswordHasher.verify(password, user.password)) return false;

    final bool isSave = await sessionService.saveSession(user: user);

    if (!isSave) return false;

    return true;
  }

  Future<bool> isLogged() async {
    return await sessionService.isLogged();
  }

  Future<bool> logout() async {
    return await sessionService.clear();
  }
}
