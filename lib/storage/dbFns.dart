// import 'package:sqflite/sqflite.dart' as sql;
//
// class SQLHelperLogin {
//   ///create db
//   static Future<sql.Database> openOrCreateDb() async {
//     return await sql.openDatabase('registration',
//         version: 1, //version 1 by default, so this step is not mandatory
//         onCreate: (database, version) async {

//           await createTable(database);
//         });
//   }
//
//   ///create table
//   static Future<void> createTable(sql.Database database) async {
//     await database.execute(
//         'CREATE TABLE UserData (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, email TEXT,password TEXT,mobile TEXT)');
//   }
//
//   ///insert value to db
//   static Future<int> create(String name, String phone,String email,String password) async {
//     final db = await SQLHelperLogin.openOrCreateDb();
//     var data = {'name': name, 'email': email,'password': password,'mobile': phone};
//     final id = await db.insert('UserData', data);
//     return id;
//   }
//
//   ///read users
//   static Future<List<Map<String, dynamic>>> readUsers() async {
//     final db = await SQLHelperLogin.openOrCreateDb();
//     // return db.query('UserData', orderBy: 'id');
//     return db.rawQuery("SELECT * FROM UserData");
//   }
//
//   static Future<List<Map<String, dynamic>>> checkUserExist(String email, String password) async {
//     final db = await SQLHelperLogin.openOrCreateDb();
//     // return db.query('UserData', orderBy: 'id');
//     return db.rawQuery("SELECT * FROM UserData WHERE email = '$email' AND password = '$password'");
//   }
//
//   static Future<List<Map<String, dynamic>>> alreadyRegistered(String email) async {
//     final db = await SQLHelperLogin.openOrCreateDb();
//     return db.rawQuery("SELECT * FROM UserData WHERE email = '$email'");
//   }
//
//
//   static Future<int> update(int id, String name, String phone,String email,String password) async {
//     final db = await SQLHelperLogin.openOrCreateDb();
//     var data = {'name': name, 'mobile': phone,'email': email,'password': password};
//     return id = await db.update('Task', data, where: 'id = ?', whereArgs: [id]);
//   }
//
//   static Future<void> deleteUser(int id) async {
//     final db = await SQLHelperLogin.openOrCreateDb();
//     try {
//       await db.delete('UserData', where: 'id = ?', whereArgs: [id]);
//     } catch (error) {
//       print(error);
//     }
//   }
// }
