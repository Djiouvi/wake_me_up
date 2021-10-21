import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wake_me_up/dart/entity/abstract/abstractBaseDataEntity.dart';

abstract class AbstractRepository<T extends AbstractBaseDataEntity> {
  String path = "";
  final String scriptInit;
  final String tableName;
  final int version;

  AbstractRepository(
      {required this.scriptInit,
      required this.tableName,
      required this.version}) {
    this.path = this.tableName + '.db';
  }

  Future<Database> get database async {
    WidgetsFlutterBinding.ensureInitialized();

    return openDatabase(
      join(await getDatabasesPath(), this.path),
      onCreate: (db, version) {
        return db.execute(this.scriptInit);
      },
      version: this.version,
    );
  }

  Future<void> insert(T t) async {
    final db = await database;

    await db.insert(tableName, t.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getAll(
      {String? query, String? sort}) async {
    final db = await database;

    return await db.query(tableName, orderBy: sort);
  }

  Future<dynamic> getOne(double id) async {
    final db = await database;
    return await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> update(T t) async {
    final db = await database;

    await db.update(
      tableName,
      t.toMap(),
      where: 'id = ?',
      whereArgs: [t.id],
    );
  }

  Future<void> delete(double id) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
