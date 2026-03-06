// import 'package:personal_finance_tcc/external/database/db_service.dart';
// import 'package:personal_finance_tcc/presenter/models/account.dart';

import 'package:glorious_tcc/data/models/transaction_category_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';

class TransactionCategorySeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<TransactionCategoryDTO> accounts = [
      TransactionCategoryDTO(
        name: 'Vendas',
        financialAreaId: 1,
        accountId: 1,
      ),
      TransactionCategoryDTO(
        name: 'Despesa fixa',
        financialAreaId: 2,
        accountId: 1,
      ),
    ];

    List<Future<dynamic>> funcs = [];
    for (var account in accounts) {
      funcs.add(dbService.insert(TransactionCategoryDTO.table, account));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${TransactionCategoryDTO.table}');
  }
}
