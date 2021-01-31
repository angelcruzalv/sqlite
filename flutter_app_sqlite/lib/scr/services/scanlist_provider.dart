import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/models/scan_model.dart';
import 'package:flutter_app_sqlite/scr/services/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  newScan(String value) async {
    final newScan = new ScanModel(valor: value);
    final id = await DBProvider.db.newScan(newScan);
    //Asigna el id de la db al modelo
    newScan.id = id;
    if (this.selectedType == newScan.tipo) {
      this.scans.add(newScan);
      notifyListeners();
    }
  }

  getScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  getScansByTipo(String tipo) async {
    final scans = await DBProvider.db.getScansByTipo(tipo);
    this.scans = [...scans];
    this.selectedType = tipo;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScanById(id);
    this.getScansByTipo(this.selectedType);
  }
}
