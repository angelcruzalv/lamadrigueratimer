import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerTiles extends StatefulWidget {
  @override
  _TimerTilesState createState() => _TimerTilesState();
}

class _TimerTilesState extends State<TimerTiles> {
  final StopWatchTimer _stopWatchTimer = new StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Column(
        children: [
          Row(
            children: [
              StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                builder: (context, snapshot) {
                  final value = snapshot.data;
                  final displayTime =
                      StopWatchTimer.getDisplayTime(value, hours: _isHours);
                  return Text(
                    displayTime,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  );
                },
              ),
              ElevatedButton(
                  child: Icon(Icons.play_arrow),
                  style: ButtonStyle(),
                  onPressed: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  }),
              ElevatedButton(
                  child: Icon(Icons.stop),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                  }),
              ElevatedButton(
                  child: Icon(Icons.delete_forever),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                  }),
            ],
            // onTap: () {
            //   _stopWatchTimer.onExecute.add(StopWatchExecute.start);
            // },
          ),
        ],
      ),
    );
  }

  //   DateTime alert = DateTime.now().add(Duration(seconds: 10));
  //   return Container(
  //     child: TimerBuilder.scheduled([alert], builder: (context) {
  //       var now = DateTime.now();
  //       var reached = now.compareTo(alert) >= 0;
  //       return Column(
  //         children: <Widget>[
  //           Icon(
  //             reached ? Icons.alarm_on : Icons.alarm,
  //             color: reached ? Colors.red : Colors.green,
  //             size: 48,
  //           ),
  //           !reached
  //               ? TimerBuilder.periodic(Duration(seconds: 1),
  //                   alignment: Duration.zero, builder: (context) {
  //                   // This function will be called every second until the alert time
  //                   var now = DateTime.now();
  //                   var remaining = alert.difference(now);
  //                   return Text(
  //                     formatDuration(remaining),
  //                   );
  //                 })
  //               : Text(
  //                   "Alert",
  //                 ),
  //           ElevatedButton(
  //             child: Text("Reset"),
  //             onPressed: () {
  //               setState(() {
  //                 alert = DateTime.now().add(Duration(seconds: 10));
  //               });
  //             },
  //           ),
  //         ],
  //       );
  //     }),
  //   );
  // }

  // Widget _tiles() {
  //   DateTime alert = DateTime.now().add(Duration(seconds: 10));
  //   return Container(
  //     child: TimerBuilder.scheduled([alert], builder: (context) {
  //       var now = DateTime.now();
  //       var reached = now.compareTo(alert) >= 0;
  //       return Column(
  //         children: <Widget>[
  //           Icon(
  //             reached ? Icons.alarm_on : Icons.alarm,
  //             color: reached ? Colors.red : Colors.green,
  //             size: 48,
  //           ),
  //           !reached
  //               ? TimerBuilder.periodic(Duration(seconds: 1),
  //                   alignment: Duration.zero, builder: (context) {
  //                   // This function will be called every second until the alert time
  //                   var now = DateTime.now();
  //                   var remaining = alert.difference(now);
  //                   return Text(
  //                     formatDuration(remaining),
  //                   );
  //                 })
  //               : Text(
  //                   "Alert",
  //                 ),
  //           ElevatedButton(
  //             child: Text("Reset"),
  //             onPressed: () {
  //               setState(() {
  //                 alert = DateTime.now().add(Duration(seconds: 10));
  //               });
  //             },
  //           ),
  //         ],
  //       );
  //     }),
  //   );
  // }
}

String formatDuration(Duration d) {
  String f(int n) {
    return n.toString().padLeft(2, '0');
  }

  // We want to round up the remaining time to the nearest second
  d += Duration(microseconds: 999999);
  return "${f(d.inMinutes)}:${f(d.inSeconds % 60)}";
}
