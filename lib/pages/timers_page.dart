import 'package:flutter/material.dart';
import 'package:timer/widgets/timer_tiles.dart';

class TimersPage extends StatelessWidget {
  const TimersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (_, i) => ListTile(
        leading: Text((i + 1).toString()),
        title: TimerTiles(),
      ),
    );
  }
}
