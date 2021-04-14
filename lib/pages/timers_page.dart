import 'package:flutter/material.dart';
import 'package:timer/widgets/timer_tiles.dart';

class TimersPage extends StatefulWidget {
  TimersPage({Key key}) : super(key: key);

  @override
  _TimersPageState createState() => _TimersPageState();
}

class _TimersPageState extends State<TimersPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 12,
        itemBuilder: (BuildContext context, int _index) {
          return Container(
            color: (_index % 2 == 0) ? Color(0xFF0A0E21) : Color(0xFF363636),
            height: 120,
            child: TimerTiles(
              index: _index,
            ),
          );
        });
  }
}
