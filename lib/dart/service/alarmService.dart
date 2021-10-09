import 'package:injector/injector.dart';
import 'package:wake_me_up/dart/entity/Alarm.dart';
import 'package:wake_me_up/dart/repository/AlarmRepository.dart';

class AlarmService {

  late final AlarmRepository repository;

  AlarmService() {
    this.repository = Injector.appInstance.get<AlarmRepository>();
  }

  Future<List<Alarm>> getAll() async {
     var all = await this.repository.getAll();

     return List.generate(all.length, (index) {
       return Alarm(
         id: all[index]['id'],
         dateToWakeUp: DateTime.parse(all[index]['dateToWakeUp']),
         active: all[index]['active'],
         description: all[index]['description'],
       );
     });
  }

  Future<void> insert(Alarm alarm) async {
    await this.repository.insert(alarm);
  }
}