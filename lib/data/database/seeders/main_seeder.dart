import 'package:glorious_tcc/data/database/seeders/account_seeder.dart';
import 'package:glorious_tcc/data/database/seeders/bank_account_seeder.dart';
import 'package:glorious_tcc/data/database/seeders/contact_seeder.dart';
import 'package:glorious_tcc/data/database/seeders/financial_area_seeder.dart';
import 'package:glorious_tcc/data/database/seeders/institution_seeder.dart';
import 'package:glorious_tcc/data/database/seeders/transaction_category_seeder.dart';
import 'package:glorious_tcc/data/database/seeders/transaction_seeder.dart';
import 'package:glorious_tcc/data/database/seeders/user_seeder.dart';
import 'package:glorious_tcc/data/services/db_service.dart';

class MainSeeder {
  static Future<void> execute({bool resetDatabase = true}) async {
    if (resetDatabase) await DbService.instance.resetDatabase();

    // accounts
    // users
    // financial_areas
    // categories
    // institutions
    // bank_accounts
    // contacts
    // transactions
    await Future.wait([
      AccountSeeder.reset(),
      InstitutionSeeder.reset(),
      BankAccountSeeder.reset(),
      FinancialAreaSeeder.reset(),
      TransactionCategorySeeder.reset(),
      ContactSeeder.reset(),
      UserSeeder.reset(),
      TransactionSeeder.reset(),
    ]);

    await Future.wait([
      AccountSeeder.execute(),
      InstitutionSeeder.execute(),
      BankAccountSeeder.execute(),
      FinancialAreaSeeder.execute(),
      TransactionCategorySeeder.execute(),
      ContactSeeder.execute(),
      UserSeeder.execute(),
      TransactionSeeder.execute(),
    ]);
  }
}
