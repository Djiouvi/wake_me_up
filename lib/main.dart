import 'package:flutter/material.dart';
import 'package:wake_me_up/screens/alarm_list.dart';

void main() => runApp(WakeMeUp());

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