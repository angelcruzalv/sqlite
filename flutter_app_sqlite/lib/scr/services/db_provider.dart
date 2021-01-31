import 'dart:io';
import 'package:flutter_app_sqlite/scr/models/scan_model.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    //path de donde almacenaremos la db
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    final path = join(docsDirectory.path, 'ScansDB.db');
    print(path);

    //crear db
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE Scans(
        id INTEGER PRIMARY KEY,
        tipo TEXT,
        valor TEXT
      )
      ''');
    });
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  Future<ScanModel> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ? ', whereArgs: [id]);

    /* return res.isNotEmpty ? ScanModel.fromJson(res.first) : null; */
    if (res.isNotEmpty) {
      return ScanModel.fromJson(res.first);
    } else {
      return null;
    }
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    if (res.isNotEmpty) {
      return res.map((e) => ScanModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<ScanModel>> getScansByTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
    SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');
    if (res.isNotEmpty) {
      return res.map((e) => ScanModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
