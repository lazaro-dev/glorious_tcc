import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:glorious_tcc/data/database/migration.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase {
  static final SqfliteDatabase instance = SqfliteDatabase._init();
  SqfliteDatabase._init();

  static Database? _database;
  final String _databaseName = 'financial.db';
  final int _version = 1;
  final _tables = Migration.tables;

  Future<Database> get database async {
    if (_database != null) return _database!;

    try {
      return await _getDatabase();
    } catch (e) {
      throw Exception('Falha ao iniciar banco de dados local!');
    }
  }

  void _createDb(Database db, int newVersion) async {
    Batch batch = db.batch();

    for (var table in _tables) {
      batch.execute(table);
    }

    await batch.commit();
  }

  Future<Database> _getDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      onCreate: _createDb,
      version: _version,
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  Future<void> resetDatabase() async {
    final db = await instance.database;

    try {
      for (var table in _tables) {
        final tableName = table.split(' ')[2].trim();
        await db.execute('DROP TABLE IF EXISTS $tableName');
      }
    } catch (e) {}

    try {
      _createDb(db, _version);
    } catch (e) {}
  }
}
