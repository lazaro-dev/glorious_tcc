// import 'package:personal_finance_tcc/external/database/db_service.dart';
// import 'package:personal_finance_tcc/presenter/models/account.dart';

import 'package:glorious_tcc/data/models/account_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';

class AccountSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<AccountDTO> accounts = [
      AccountDTO(
        id: 1,
        name: 'Conta 1',
        type: 'Pessoal 1',
      ),
      AccountDTO(
        id: 2,
        name: 'Conta 2',
        type: 'Pessoal 2',
      ),
    ];

    List<Future<dynamic>> funcs = [];
    for (var account in accounts) {
      funcs.add(dbService.insert(AccountDTO.table, account));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${AccountDTO.table}');
  }
}
