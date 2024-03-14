import 'package:sqflite/sqflite.dart' as sql;

class SQLHelperLogin {
  ///create db
  static Future<sql.Database> openOrCreateDb() async {
    return await sql.openDatabase('registration',
        version: 1,
        onCreate: (database, version) async {
          await createTable(database);
        });
  }

  ///create table
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
        'CREATE TABLE UserData (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, email TEXT,password TEXT,phone TEXT,profession TEXT)');
  }

  ///insert value to db
  static Future<int> create(String name, String phone,String email,String password, String profession) async {
    final db = await SQLHelperLogin.openOrCreateDb();
    var data = {'name': name, 'email': email,'password': password,'phone': phone, 'profession': profession};
    final id = await db.insert('UserData', data);
    return id;
  }

  ///read users
  static Future<List<Map<String, dynamic>>> readUsers() async {
    final db = await SQLHelperLogin.openOrCreateDb();
    // return db.query('UserData', orderBy: 'id');
    return db.rawQuery("SELECT * FROM UserData");
  }

  static Future<List<Map<String, dynamic>>> checkUserExist(String email, String password) async {
    final db = await SQLHelperLogin.openOrCreateDb();
    return db.rawQuery("SELECT * FROM UserData WHERE email = '$email' AND password = '$password'");
  }

  static Future<List<Map<String, dynamic>>> alreadyRegistered(String email) async {
    final db = await SQLHelperLogin.openOrCreateDb();
    return db.rawQuery("SELECT * FROM UserData WHERE email = '$email'");
  }

}
