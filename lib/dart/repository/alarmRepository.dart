import 'package:wake_me_up/dart/entity/alarm.dart';
import 'abstract/abstractRepository.dart';

const String ALARM_TABLE = "alarm";
const String INIT_DB =
    "CREATE TABLE " + ALARM_TABLE + "(id INTEGER PRIMARY KEY, description TEXT, dateToWakeUp TEXT, active INTEGER)";
const int VERSION = 1;

class AlarmRepository extends AbstractRepository<Alarm> {
  AlarmRepository()
      : super(scriptInit: INIT_DB, tableName: ALARM_TABLE, version: VERSION);
}
