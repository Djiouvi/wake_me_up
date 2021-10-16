import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wake_me_up/dart/utils/DateUtils.dart';

class AlarmCard extends StatelessWidget {

  String description;
  DateTime? date;
  int active;

  AlarmCard({
    required this.description,
    required this.date,
    required this.active,
  });

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
                DateUtilsBja.dateTimeToString(date, DateUtilsBja.TIME_FORMAT),
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
                    this.description,
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
                  value: true,
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
