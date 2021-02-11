import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/services/scanlist_provider.dart';
import 'package:flutter_app_sqlite/scr/widgets/scan_tiles.dart';
import 'package:provider/provider.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(type: 'http');
  }
}
