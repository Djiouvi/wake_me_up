import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:wake_me_up/dart/service/alarmService.dart';
import 'package:wake_me_up/screens/alarm_list.dart';

import 'dart/repository/AlarmRepository.dart';

void main() => {
      getDependency(),
      runApp(WakeMeUp()),
    };

class WakeMeUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: AlarmList(),
    );
  }
}

getDependency() {
  final injector = Injector.appInstance;

  injector.registerSingleton(() => AlarmRepository());
  injector.registerSingleton(() => AlarmService());
}
