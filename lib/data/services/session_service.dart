import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const _accountIdKey = 'account_id';
  static const _userIdKey = 'user_id';

  Future<void> saveSession({
    required int userId,
    required int accountId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userIdKey, userId);
    await prefs.setInt(_accountIdKey, accountId);
  }

  Future<int?> get accountId async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_accountIdKey);
  }

  Future<int?> get userId async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userIdKey);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
