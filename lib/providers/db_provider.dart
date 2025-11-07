import 'dart:io';

import 'package:contactos/models/contacto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  /*
  Patrón Singleton: Permite la creación de una única instancia
  - Constructor privado
  - Método de accesibilidad que devuelva el objeto creado
  */

  static Database? _database;
  static final DbProvider db = DbProvider._();

  DbProvider._();

  /*
  Declarar un getter asíncrono para acceder a la BD.
  */
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory directorio = await getApplicationDocumentsDirectory();
    final rutaDB = join(directorio.path, "directorio.db");
    return await openDatabase(
      rutaDB,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE contactos(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nombre TEXT,
              telefono TEXT,
              email TEXT
            )
          ''');
      },
    );
  }

  Future<List<Contacto>?> listadoContactos() async {
    final db = await database;
    final resultado = await db!.query("contactos");

    return resultado.isNotEmpty
        ? resultado.map((c) => Contacto.fromMap(c)).toList()
        : null;
  }

  Future<int> nuevoContacto(Contacto contacto) async {
    final db = await database;
    final resultado = await db!.insert("contactos", contacto.toMap());
    return resultado;
  }

  Future<bool> eliminarContacto(int id) async {
    final db = await database;
    final resultado = await db!.delete(
      "contactos",
      where: 'id = ?',
      whereArgs: [id],
    );
    return resultado > 0;
  }

  //TODO: Implementar el método buscarContactoPorId y actualizaContacto
  //
}
