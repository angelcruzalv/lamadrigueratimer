import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/pages/settings_page.dart';
import 'package:timer/pages/timers_page.dart';
import 'package:timer/services/ui_provider.dart';
import 'package:timer/widgets/custom_navbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              height: 100,
            ),
            Container(padding: const EdgeInsets.all(1.0), child: Text('Timer'))
          ],
        ),
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //get selectedMenuOpt UiProvider
    final uiProvider = Provider.of<UiProvider>(context);

    //Change menuOpt nav bar
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return TimersPage();
      case 1:
        return SettingsPage();

      default:
        return TimersPage();

        break;
    }
  }
}
