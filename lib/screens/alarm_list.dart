import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:wake_me_up/component/alarm_card.dart';
import 'package:wake_me_up/dart/entity/alarm.dart';
import 'package:wake_me_up/dart/service/alarmService.dart';

class AlarmList extends StatefulWidget {
  @override
  _AlarmPageList createState() => _AlarmPageList();
}

class _AlarmPageList extends State<AlarmList> {
  AlarmService alarmService = Injector.appInstance.get<AlarmService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Super titre"),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: alarmService.getAll(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Alarm>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error : ${snapshot.error}'),
                  );
                } else {
                  return Column(
                    children: [
                      for (var a in snapshot.data!)
                        AlarmCard(
                            description: a.description,
                            date: a.dateToWakeUp,
                            active: a.active),
                    ],
                  );
                }
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Alarm alarm = new Alarm(
              description: "description",
              dateToWakeUp: DateTime.now(),
              active: 1);
          await alarmService.insert(alarm);
        },
      ),
    );
  }
}
