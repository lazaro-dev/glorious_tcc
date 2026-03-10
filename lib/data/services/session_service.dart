import 'dart:convert';

import 'package:glorious_tcc/data/models/user_dto.dart';
import 'package:glorious_tcc/data/services/local_storage_service.dart';
import 'package:glorious_tcc/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const _accountIdKey = 'account_id';
  static const _userIdKey = 'user_id';
  static const _userKey = 'user';

  Future<bool> saveSession({
    required User user,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userIdKey, user.id!);
    await prefs.setInt(_accountIdKey, user.accountId!);

    final bool result = await LocalStorageService.instance
        .setString(_userKey, jsonEncode(user.toJson()));

    return result;
  }

  Future<int?> get accountId async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_accountIdKey);
  }

  Future<int?> get userId async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userIdKey);
  }

  Future<User?> get user async {
    final String? strUser =
        await LocalStorageService.instance.getString(_userKey);

    if (strUser == null) return null;

    final jsonUser = json.decode(strUser);

    final user = UserDTO.fromMap(jsonUser);

    return user.toDomain();
  }

  Future<bool> isLogged() async {
    final String? strUser =
        await LocalStorageService.instance.getString(_userKey);

    return (strUser != null) ? true : false;
  }

  Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    final bool result = await prefs.clear();

    return result;
  }
}
