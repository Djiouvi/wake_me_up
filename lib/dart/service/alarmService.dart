import 'package:injector/injector.dart';
import 'package:wake_me_up/dart/entity/abstract/abstractBaseDataEntity.dart';
import 'package:wake_me_up/dart/entity/alarmEntity.dart';
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
    var list = await super.getAll(sort: sort);

    list.sort((a, b) {
      var active = b.active.compareTo(a.active);
      if(active != 0) {
        return active;
      }
      var hours = a.dateToWakeUp!.hour.compareTo(b.dateToWakeUp!.hour);
      if(hours != 0) {
        return hours;
      }
      return a.dateToWakeUp!.minute.compareTo(b.dateToWakeUp!.minute);
    });

    return list;
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

  deleteAll() {
    repository.deleteAll();
  }
}
