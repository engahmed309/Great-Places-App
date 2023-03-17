import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    var DBPath = await sql.getDatabasesPath();
    final sqlDB = await sql.openDatabase(path.join(DBPath, "places.db"),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image Text)');
    }, version: 1);
    sqlDB.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
