// import 'package:personal_finance_tcc/external/database/db_service.dart';
// import 'package:personal_finance_tcc/presenter/models/account.dart';

import 'package:glorious_tcc/data/models/contact_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';

class ContactSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<ContactDTO> contacts = [
      ContactDTO(
        name: 'Cliente 1',
        type: 'Cliente',
        accountId: 1,
      ),
      ContactDTO(
        name: 'Fornecedor 1',
        type: 'Fornecedor',
        accountId: 1,
      ),
    ];

    List<Future<dynamic>> funcs = [];
    for (var contact in contacts) {
      funcs.add(dbService.insert(ContactDTO.table, contact));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${ContactDTO.table}');
  }
}
