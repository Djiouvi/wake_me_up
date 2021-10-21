import 'abstractBaseIdentifiableEntity.dart';

abstract class AbstractBaseAuditableEntity extends AbstractBaseIdentifiableEntity {
  DateTime? createdAt = DateTime.now();
  String? createdBy = "BJA";
  DateTime? updatedAt;
  String? updatedBy = "";

  AbstractBaseAuditableEntity(
      this.createdAt, this.createdBy, this.updatedAt, this.updatedBy, id): super(id);
}
