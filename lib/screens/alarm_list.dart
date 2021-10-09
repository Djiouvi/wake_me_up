import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:wake_me_up/dart/entity/Alarm.dart';
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
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.android),
          color: Colors.white,
          onPressed: () async {
            var list = await this.alarmService.getAll();

            list.forEach((element) {print(element);});
          },
        ),
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
