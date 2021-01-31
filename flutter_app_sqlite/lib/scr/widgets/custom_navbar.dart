import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/services/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    int currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapas'),
        BottomNavigationBarItem(icon: Icon(Icons.web), label: 'Direcciones'),
      ],
    );
  }
}
