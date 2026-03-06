import 'package:glorious_tcc/data/database/sqflite_database.dart';
import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/ui/core/database/model_registry.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  static final DbService instance = DbService._init();
  DbService._init();

  static Future<Database> get db => SqfliteDatabase.instance.database;

  Future<List<T>> select<T extends ModelDTO>(
    String tableName, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // final Database db = await SqfliteDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await (await db).query(
      tableName,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );

    return maps.map((map) => ModelRegistry.create<T>(map)).toList();
    // return maps.map((map) => fromJson(map)).toList();

    // return List.generate(
    //   maps.length,
    //   (i) {
    //     return model.fromJson(maps[i]) as T;
    //   },
    // );
  }

  Future<int> insert(
    String tableName,
    ModelDTO model,
  ) async {
    final data = Map<String, dynamic>.from(model.toJson());

    if (data['id'] == null) {
      data.remove('id');
    }

    return await (await db).insert(
      tableName,
      data,
    );
  }

  Future<void> update(
    String tableName,
    ModelDTO model,
    String where,
    List<Object?>? whereArgs,
  ) async {
    // final Database db = await SqfliteDatabase.instance.database;

    await (await db).update(
      tableName, model.toJson(),
      where: where, //'$columnId = ?'
      whereArgs: whereArgs,
    );
  }

  Future<void> delete(
    String tableName,
    String where,
    List<Object?>? whereArgs,
  ) async {
    // final Database db = await SqfliteDatabase.instance.database;

    await (await db).delete(
      tableName,
      where: where, //'$columnId = ?'
      whereArgs: whereArgs,
    );
  }

  Future<void> execute(String query) async {
    // final Database db = await SqfliteDatabase.instance.database;

    await (await db).execute(query);
  }

  Future<void> resetDatabase() async {
    await SqfliteDatabase.instance.resetDatabase();
  }
}
