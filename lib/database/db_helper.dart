import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

import '../model/cart_model.dart';

class DBHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (productId TEXT PRIMARY KEY ,productName TEXT,productPrice TEXT,  productImage TEXT )');
  }

  //insert function
  Future<Cart> insert(Cart cart) async {
    //print(cart.toMap());
    var dbClient = await db;

    if (dbClient == null) {
      dbClient = await db;
    }

    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }
//get all add to cart list function
  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }
//cart delete function
  Future<int> delete(String productId) async {
    var dbClient = await db;
    return await dbClient!
        .delete('cart', where: 'productId = ?', whereArgs: [productId]);
  }
}
