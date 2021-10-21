import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wake_me_up/dart/utils/dateUtils.dart';

class AlarmCard extends StatefulWidget {

  final String description;
  final DateTime? date;
  final int active;

  AlarmCard({
    required this.description,
    required this.date,
    required this.active,
  });

  @override
  _AlarmCardState createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(1),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.alarm),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateUtilsBja.dateTimeToString(widget.date, DateUtilsBja.TIME_FORMAT),
                style: TextStyle(fontSize: 30.0),
              )
            ],
          ),
          Flexible(
            child: Container(
              width: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    this.widget.description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text("lun., mar., mer., jeu., ven., sam.",
                      style: TextStyle(
                        fontSize: 11.0,
                      ))
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                  value: widget.active == 1,
                  onChanged: (value) {
                    print("coucou");
                  })
            ],
          )
        ],
      ),
    );
  }
}
