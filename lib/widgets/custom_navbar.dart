import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/services/ui_provider.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xFF212121),
      ),
      child: new BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.timer_rounded), label: 'Timers'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }
}
