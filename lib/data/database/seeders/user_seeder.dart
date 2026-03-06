import 'package:glorious_tcc/data/models/user_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';

class UserSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    await dbService.insert(
        UserDTO.table,
        UserDTO(
          name: 'Carlos',
          email: 'carlos@email.com',
          password: '123',
          accountId: 1,
        ));
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${UserDTO.table}');
  }
}
