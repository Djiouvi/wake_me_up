import 'package:injector/injector.dart';
import 'package:wake_me_up/dart/repository/alarmRepository.dart';

import 'alarmService.dart';

configurationDI() {
  final injector = Injector.appInstance;

  /**
   * ALARM
   */
  injector.registerSingleton(() => AlarmRepository());
  injector.registerSingleton(() => AlarmService());
}