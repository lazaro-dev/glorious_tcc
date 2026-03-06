// import 'package:personal_finance_tcc/external/database/db_service.dart';
// import 'package:personal_finance_tcc/presenter/models/account.dart';

import 'package:glorious_tcc/data/models/bank_account_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';

class BankAccountSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<BankAccountDTO> accounts = [
      BankAccountDTO(
        id: 1,
        name: 'Caixa',
        balance: 25.00,
        accountId: 1,
        institutionId: null,
      ),
      BankAccountDTO(
        id: 2,
        name: 'Corrente bradesco',
        balance: 0,
        accountId: 1,
        institutionId: 1,
      ),
    ];

    List<Future<dynamic>> funcs = [];
    for (var account in accounts) {
      funcs.add(dbService.insert(BankAccountDTO.table, account));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${BankAccountDTO.table}');
  }
}
