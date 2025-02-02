import 'package:flutter/material.dart';
// import 'package:personal_finance_tcc/external/seeders/main_seeder.dart';
import 'package:flutter/widgets.dart';
import 'package:glorious_tcc/app.dart';
// import 'dart:developer';

void main() async {
  runApp(const App());

  WidgetsFlutterBinding.ensureInitialized();
  // await MainSeeder.execute();
  // var db = DbService.instance;

  // var result = await db.select(Account.table, Account());

  // inspect(result);
}

