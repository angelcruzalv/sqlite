import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/pages/direcciones_page.dart';
import 'package:flutter_app_sqlite/scr/pages/mapas_page.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavBar(),
    );
  }

  Widget _callPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();

        break;
      default:
        return MapasPage();
    }
  }

  Widget _crearBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapas'),
        BottomNavigationBarItem(icon: Icon(Icons.web), label: 'Direcciones')
      ],
    );
  }
}
