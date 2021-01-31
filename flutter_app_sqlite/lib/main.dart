import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/pages/home_page.dart';
import 'package:flutter_app_sqlite/scr/pages/mapas_page.dart';

import 'package:flutter_app_sqlite/scr/services/scanlist_provider.dart';
import 'package:flutter_app_sqlite/scr/services/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new ScanListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QRR App',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'mapa': (_) => MapasPage(),
        },
        theme: ThemeData(primaryColor: Colors.cyan, accentColor: Colors.red),
      ),
    );
  }
}
