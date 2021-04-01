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
        title: 'La madriguera Timer',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'mapas': (_) => TimersPage(),
          'mapa': (_) => SettingsPage(),
        },
        theme: ThemeData(
            primaryColor: Colors.lightGreen, accentColor: Colors.lightGreen),
      ),
    );
  }
}
