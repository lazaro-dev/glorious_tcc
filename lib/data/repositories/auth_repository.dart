import 'dart:convert';

import 'package:glorious_tcc/data/models/user_dto.dart';
import 'package:glorious_tcc/data/services/local_storage_service.dart';

class AuthRepository {
  Future<bool> isLogged() async {
    final String? strUser =
        await LocalStorageService.instance.getString('user');

    return (strUser != null) ? true : false;
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final bool result = await LocalStorageService.instance
        .setString('user', jsonEncode({username: username}));

    return result;
  }

  Future<bool> logout() async {
    final bool result = await LocalStorageService.instance.remove('user');

    return result;
  }

  getUser() async {
    final String? strUser =
        await LocalStorageService.instance.getString('user');

    if (strUser == null) return null;

    final jsonUser = json.decode(strUser);

    return UserDTO.fromMap(jsonUser);
  }
}
