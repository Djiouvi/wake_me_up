import 'package:wake_me_up/dart/entity/abstract/abstractBaseDataEntity.dart';
import 'package:wake_me_up/dart/repository/abstract/abstractRepository.dart';

abstract class AbstractService<T extends AbstractBaseDataEntity> {

  Future<void> insert (T t) async {
    getRepository().insert(t);
  }

  Future<void> update(T t) async {
    getRepository().update(t);
  }

  Future<dynamic> getOne(double id) async {
    return getRepository().getOne(id);
  }

  Future<void> delete(double id) async {
    getRepository().delete(id);
  }

  Future<List<T>> getAll({String? query, String? sort}) async {
    var all = await getRepository().getAll(query: query, sort: sort);

    return List.generate(all.length, (index) {
      return toDto(all, index);
    });
  }

  T toDto(List<Map<String, dynamic>> all, int index);
  AbstractRepository getRepository();
}