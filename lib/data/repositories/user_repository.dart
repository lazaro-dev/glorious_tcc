import 'package:glorious_tcc/data/models/user_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';
import 'package:glorious_tcc/domain/entities/user.dart';

class UserRepository {
  final DbService _db = DbService.instance;

  UserRepository();

  Future<List<User>> findAll() async {
    final dtos = await _db.select<UserDTO>(
      UserDTO.table,
      // UserDTO().fromJson,
    );

    return dtos.map((dto) => dto.toDomain()).toList();
  }

  Future<User?> findById(int id) async {
    final result = await _db.select<UserDTO>(
      UserDTO.table,
      // (map) => UserDTO().fromJson(map),
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return result.first.toDomain();
  }

  Future<User?> findByEmail(String email) async {
    final result = await _db.select<UserDTO>(
      UserDTO.table,
      // UserDTO().fromJson,
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return result.first.toDomain();
  }

  Future<void> create(User user) async {
    await _db.insert(
      UserDTO.table,
      UserDTO.fromDomain(user),
    );
  }

  Future<void> update(User user) async {
    await _db.update(
      UserDTO.table,
      UserDTO.fromDomain(user),
      'id = ?',
      [user.id],
    );
  }

  Future<void> delete(int id) async {
    await _db.delete(
      UserDTO.table,
      'id = ?',
      [id],
    );
  }
}
