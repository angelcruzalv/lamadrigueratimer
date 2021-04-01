import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerTiles extends StatefulWidget {
  TimerTiles({Key key}) : super(key: key);

  @override
  _TimerTilesState createState() => _TimerTilesState();
}

class _TimerTilesState extends State<TimerTiles> {
  StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (_, i) => Card(
          child: ListTile(
        leading: Text((i + 1).toString()),
        title: StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            builder: (context, snapshot) {
              final value = snapshot.data;
              final displayTime =
                  StopWatchTimer.getDisplayTime(value, hours: _isHours);
              return Text(displayTime);
            }),
      )),
    );
  }
}
