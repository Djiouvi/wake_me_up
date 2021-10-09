import 'abstract/AbstractRepository.dart';

const String ALARM_TABLE = "user";
const String INIT_DB =
    "CREATE TABLE " + ALARM_TABLE + "(id INTEGER PRIMARY KEY, nom TEXT, prenom TEXT, active INTEGER)";
const int VERSION = 1;

class UserRepository extends AbstractRepository {

  UserRepository(): super(scriptInit: INIT_DB, tableName: ALARM_TABLE, version: 1);
}