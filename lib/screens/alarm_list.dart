import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmList extends StatefulWidget {
  @override
  _AlarmPageList createState() => _AlarmPageList();
}

class _AlarmPageList extends State<AlarmList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Super titre"),
      ),
    );
  }
}
