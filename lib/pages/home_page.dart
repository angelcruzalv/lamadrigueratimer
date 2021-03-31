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
        title: Text(
          'La Madriguera Timer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
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
