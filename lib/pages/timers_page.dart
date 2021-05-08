import 'package:flutter/material.dart';
import 'package:timer/widgets/timer_tiles.dart';

class TimersPage extends StatefulWidget {
  TimersPage({Key key}) : super(key: key);

  @override
  _TimersPageState createState() => _TimersPageState();
}

class _TimersPageState extends State<TimersPage> {
  final List<int> _myItems = List<int>.generate(12, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                _container(
                  index: 1,
                ),
                _container(
                  index: 2,
                ),
                _container(
                  index: 3,
                ),
                _container(
                  index: 4,
                ),
                _container(
                  index: 5,
                ),
                _container(
                  index: 6,
                ),
                _container(
                  index: 7,
                ),
                _container(
                  index: 8,
                ),
                _container(
                  index: 9,
                ),
                _container(
                  index: 10,
                ),
                _container(
                  index: 11,
                ),
                _container(
                  index: 12,
                ),
              ],
            ))
      ],
    );
    // return ListView.builder(
    //     physics: BouncingScrollPhysics(),
    //     itemCount: 12,
    //     itemBuilder: (BuildContext context, int _index)  {
    //       return Container(
    //         color: (_index % 2 == 0) ? Color(0xFF0A0E21) : Color(0xFF363636),
    //         height: 120,
    //         child: TimerTiles (
    //           index: _index,
    //         ),
    //       );
    //     });
  }
}

class _container extends StatelessWidget {
  final index;
  const _container({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: (index % 2 == 0) ? Color(0xFF0A0E21) : Color(0xFF363636),
      child: TimerTiles(
        index: index,
      ),
    );
  }
}
