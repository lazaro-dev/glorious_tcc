// import 'package:personal_finance_tcc/external/database/db_service.dart';
// import 'package:personal_finance_tcc/presenter/models/item.dart';

import 'package:glorious_tcc/data/models/financial_area_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';

class FinancialAreaSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<FinancialAreaDTO> items = [
      FinancialAreaDTO(name: 'Receitas', accountId: 1),
      FinancialAreaDTO(name: 'Despesas', accountId: 1),
    ];

    List<Future<dynamic>> funcs = [];
    for (var item in items) {
      funcs.add(dbService.insert(FinancialAreaDTO.table, item));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${FinancialAreaDTO.table}');
  }
}
