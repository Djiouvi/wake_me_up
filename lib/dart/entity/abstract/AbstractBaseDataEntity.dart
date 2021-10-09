import 'AbstractBaseAuditableEntity.dart';

abstract class AbstractBaseDataEntity extends AbstractBaseAuditableEntity {

  AbstractBaseDataEntity(createdAt, createdBy, updatedAt, updatedBy, id)
      : super(createdAt, createdBy, updatedAt, updatedBy, id);

  Map<String, dynamic> toMap();

  fromMap(Map<String, dynamic> map);
}
