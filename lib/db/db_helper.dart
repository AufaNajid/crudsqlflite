import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static const String _dbPath = "note_db.db";
  static Database? _db;

  static Future <void> initDb() async {
    var path = await getDatabasesPath();
    _db = await openDatabase(
      join(path, _dbPath),
      onCreate: (Database db, int version) async {
        await db.execute("""
          CREATE TABLE Notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT
          )
        """);
      },
      version: 1,
    );
  }

  static Database? getDb() {
    if (_db == null) {
      throw Exception("Database not initialized");
    }
    return _db;
  }
}
