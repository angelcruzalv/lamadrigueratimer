import 'package:flutter/material.dart';
import 'package:timer/widgets/timer_tiles.dart';

class TimersPage extends StatelessWidget {
  const TimersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return _ListItem(
            index: index,
          );
        });
  }
}

class _ListItem extends StatelessWidget {
  _ListItem({this.index});
  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: (index % 2 == 0) ? Color(0xFF0A0E21) : Color(0xFF363636),
      child: ListTile(
          leading: Text((index + 1).toString()),
          title: Text(
            '00:00:00',
            style: TextStyle(color: Color(0xFF98D811), fontSize: 30),
          ),
          subtitle: Text(
              'Esta es una nota que será guardada \n en una base de datos...',
              style: TextStyle(color: Color(0xFF6F7959), fontSize: 15)),
          trailing: Container(
            child: Column(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 5,
                    icon: Icon(
                      Icons.play_arrow,
                      size: 45,
                    ),
                    color: Color(0xFF98D811),
                    onPressed: () => {}),
              ],
            ),
          )),
    );
  }
}
