import 'dart:async';

import 'package:flutter/material.dart';

class TimerTiles extends StatefulWidget {
  final int index;
  const TimerTiles({this.index}); //parameter from the times_page
  @override
  _TimerTilesState createState() => _TimerTilesState();
}

class _TimerTilesState extends State<TimerTiles> {
  bool flag = true;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text((widget.index)
            .toString()), //pass index parameter from the stateful widget
        Text(
          "$hoursStr:$minutesStr:$secondsStr",
          style: TextStyle(color: Color(0xFF32CD32), fontSize: 30),
        ),
        IconButton(
            icon: Icon(
              Icons.play_arrow,
              color: Color(0xFF3BFF3B),
              size: 40,
            ),
            onPressed: () {
              timerStream = stopWatchStream();
              timerSubscription = timerStream.listen((int newTick) {
                setState(() {
                  hoursStr = ((newTick / (60 * 60)) % 60)
                      .floor()
                      .toString()
                      .padLeft(2, '0');
                  minutesStr =
                      ((newTick / 60) % 60).floor().toString().padLeft(2, '0');
                  secondsStr =
                      (newTick % 60).floor().toString().padLeft(2, '0');
                });
              });
            }),
        IconButton(
            icon: Icon(
              Icons.stop,
              color: Color(0xFF99004D),
              size: 40,
            ),
            onPressed: () {
              timerSubscription.cancel();
            }),
        IconButton(
            icon: Icon(
              Icons.restore,
              color: Color(0xFF0790E6),
            ),
            onPressed: () {
              timerSubscription.cancel();
              timerStream = null;
              setState(() {
                hoursStr = '00';
                minutesStr = '00';
                secondsStr = '00';
              });
            })
      ],
    );
  }
}
