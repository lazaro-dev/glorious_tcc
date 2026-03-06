import 'package:glorious_tcc/data/services/auth_service.dart';
import 'package:glorious_tcc/ui/core/state/state_manager.dart';

class AuthViewModel {
  final AuthService _authService;

  final StateManager<bool> authState = StateManager(false);

  AuthViewModel(this._authService);

  Future<void> checkLogin() async {
    authState.setLoading();

    try {
      final isLogged = await _authService.isLogged();
      authState.setSuccess(isLogged);
    } catch (e) {
      authState.setFailure("Erro ao verificar login");
    }
  }

  Future<void> login(String username, String password) async {
    authState.setLoading();

    try {
      final isAuthenticated = await _authService.login(
        username: username,
        password: password,
      );

      if (!isAuthenticated) {
        authState.setFailure("Usuário ou senha inválidos");
        return;
      }

      authState.setSuccess(true);
    } catch (e) {
      authState.setFailure("Erro ao autenticar");
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    authState.setSuccess(false);
  }
}
