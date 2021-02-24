import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/models/scan_model.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}
