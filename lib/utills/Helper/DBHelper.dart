import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/quotes_model.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  Database? db;

  Future initDB() async {
    String dbLoaction = await getDatabasesPath();

    String path = join(dbLoaction, 'Quotes.db');

    db = await openDatabase(path, version: 1, onCreate: (db, _) async {
      String query =
          "CREATE TABLE category(id INTEGER PRIMARY KEY , category_name TEXT NOT NULL);";

      await db.execute(query);
    });
  }

  Future insertCategory({required QuotesModel data}) async {
    await initDB();

    String query = "INSERT INTO category(id, category_name)VALUES(?,?);";
    List args = [data.id, data.category];

    int res = await db!.rawInsert(query, args);

    print(res);
  }

  Future<List<QuotesModel>> fatchAllCategory() async {
    await initDB();

    String query = "SELECT * FROM category";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<QuotesModel> allCategory =
        res.map((e) => QuotesModel.fromJson(e)).toList();

    return allCategory;
  }
}
