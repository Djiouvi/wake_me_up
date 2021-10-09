import 'package:wake_me_up/dart/entity/Alarm.dart';
import 'abstract/AbstractRepository.dart';

const String ALARM_TABLE = "alarm";
const String INIT_DB =
    "CREATE TABLE " + ALARM_TABLE + "(id INTEGER PRIMARY KEY, description TEXT, dateToWakeUp TEXT, active INTEGER)";
const int VERSION = 1;

class AlarmRepository extends AbstractRepository {
  AlarmRepository()
      : super(scriptInit: INIT_DB, tableName: ALARM_TABLE, version: VERSION);

  Future<List<Alarm>> getAllMapped() async {

    var all = await super.getAll();

    return List.generate(all.length, (index) {
      return Alarm(
        id: all[index]['id'],
        dateToWakeUp: all[index]['dateToWakeUp'],
        active: all[index]['active'],
        description: all[index]['description'],
      );
    });
  }
}
