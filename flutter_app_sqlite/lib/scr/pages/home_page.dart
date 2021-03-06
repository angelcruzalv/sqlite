import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/models/scan_model.dart';
import 'package:flutter_app_sqlite/scr/pages/direcciones_page.dart';
import 'package:flutter_app_sqlite/scr/pages/mapas_page.dart';
import 'package:flutter_app_sqlite/scr/services/db_provider.dart';
import 'package:flutter_app_sqlite/scr/services/scanlist_provider.dart';
import 'package:flutter_app_sqlite/scr/services/ui_provider.dart';
import 'package:flutter_app_sqlite/scr/widgets/custom_navbar.dart';
import 'package:flutter_app_sqlite/scr/widgets/scann_button.dart';

import 'package:provider/provider.dart';

import 'mapa_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Reader'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              scanListProvider.deleteAll();
            },
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: usar el scanlistprovider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.getScansByTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.getScansByTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();

        break;
    }
  }
}
/* 
void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //obtener el _selectedMenuOpt
  final uiProvider = Provider.of<UiProvider>(context);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Reader'),
        actions: [
          Icon(Icons.delete_forever),
        ],
      ),
      body: DireccionesPage(),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
 */
