import 'package:injector/injector.dart';
import 'package:wake_me_up/dart/entity/abstract/abstractBaseDataEntity.dart';
import 'package:wake_me_up/dart/entity/alarm.dart';
import 'package:wake_me_up/dart/repository/abstract/abstractRepository.dart';
import 'package:wake_me_up/dart/repository/alarmRepository.dart';
import 'package:wake_me_up/dart/service/abstract/abstractService.dart';

class AlarmService extends AbstractService<Alarm>{
  late final AlarmRepository repository;

  AlarmService() {
    this.repository = Injector.appInstance.get<AlarmRepository>();
  }

  @override
  Future<List<Alarm>> getAll({String? query, String? sort}) async {
    String? sort = "active DESC";
    return await super.getAll(sort: sort);
  }

  Future<void> insert(Alarm alarm) async {
    await super.insert(alarm);
  }

  @override
  AbstractRepository<AbstractBaseDataEntity> getRepository() {
    return repository;
  }

  @override
  Alarm toDto(List<Map<String, dynamic>> all, int index) {
    return Alarm(
      id: all[index]['id'],
      dateToWakeUp: DateTime.parse(all[index]['dateToWakeUp']),
      active: all[index]['active'],
      description: all[index]['description'],
    );
  }
}
