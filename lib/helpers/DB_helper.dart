import 'package:sqflite/sqflite.dart' as sql;
import '';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> dataBase() async {
    var DBPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(DBPath, "places.db"),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image Text)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.dataBase();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.dataBase();
    return db.query(table);
  }
}
