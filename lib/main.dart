import 'package:flutter/material.dart';
import 'package:timer/pages/home_page.dart';
import 'package:timer/pages/settings_page.dart';
import 'package:timer/pages/timers_page.dart';

import 'package:timer/services/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'mapas': (_) => TimersPage(),
          'mapa': (_) => SettingsPage(),
        },
        theme: ThemeData(
          primaryColor: Color(0xFF152423),
          scaffoldBackgroundColor: Color(0xFF282D0C),
          accentColor: Color(0xFF98D811),
        ),
      ),
    );
  }
}
