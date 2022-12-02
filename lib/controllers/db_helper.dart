import 'dart:developer';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../global/global.dart';
import '../modals/product_modal.dart';

class ProductDBHelper {
  ProductDBHelper._();

  static final ProductDBHelper productDBHelper = ProductDBHelper._();

  final String dbName = "products.db";
  String tableName = "products";

  String colId = "id";
  String colName = "name";
  String colPrice = "price";
  String colImage = "image";
  String colQuantity = "quantity";
  String colIsLike = "isLike";
  String colCategory = "category";

  Database? db;

  Future initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    db = await openDatabase(path, version: 1, onCreate: (db, version) {});

    await db?.execute(
        "CREATE TABLE IF NOT EXISTS $tableName ($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT,$colPrice INTEGER,$colQuantity INTEGER,$colCategory TEXT,$colImage TEXT,$colIsLike TEXT);");
  }

  Future insertData() async {
    await initDB();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;

    if (isInserted == false) {
      for (int i = 0; i < products.length; i++) {
        String query =
            "INSERT INTO $tableName($colName, $colPrice, $colQuantity, $colCategory,$colImage,$colIsLike) VALUES(?, ?, ?, ?, ?, ?)";

        List args = [
          products[i].name,
          products[i].price,
          products[i].quantity,
          products[i].category,
          products[i].image,
          products[i].isLike,
        ];

        await db?.rawInsert(query, args);
      }
      prefs.setBool(tableName, true);
    }
  }

  Future updateFavourite({required int id, required String isLike}) async {
    initDB();
    String query = "UPDATE $tableName SET $colIsLike = ? WHERE $colId = ?";
    List args = [isLike, id];

    await db?.rawUpdate(query, args);
  }

  Future<List<ProductDB>> fetchAllData() async {
    await initDB();
    await insertData();

    String query = "SELECT * FROM $tableName";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<ProductDB> productList =
        res.map((e) => ProductDB.fromMap(data: e)).toList();

    return productList;
  }
}
