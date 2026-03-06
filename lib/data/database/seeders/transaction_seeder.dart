// import 'package:personal_finance_tcc/external/database/db_service.dart';
// import 'package:personal_finance_tcc/presenter/models/account.dart';

import 'package:glorious_tcc/data/models/transaction_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';
import 'package:glorious_tcc/domain/entities/transaction.dart';

class TransactionSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<TransactionDTO> accounts = [
      TransactionDTO(
        description: 'Vendas',
        value: 100.0,
        date: DateTime.now(),
        status: TransactionStatus.pending.name,
        financialAreaId: 1,
        categoryId: null,
        bankAccountOriginId: 1,
        bankAccountDestinationId: null,
        contactId: null,
        accountId: 1,
      ),
      TransactionDTO(
        description: 'Conta de luz',
        value: 180.0,
        date: DateTime.now(),
        status: TransactionStatus.paid.name,
        financialAreaId: 2,
        categoryId: null,
        bankAccountOriginId: 1,
        bankAccountDestinationId: null,
        contactId: null,
        accountId: 1,
      ),
    ];

    List<Future<dynamic>> funcs = [];
    for (var account in accounts) {
      funcs.add(dbService.insert(TransactionDTO.table, account));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${TransactionDTO.table}');
  }
}
