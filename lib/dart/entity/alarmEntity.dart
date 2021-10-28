import 'package:wake_me_up/dart/entity/abstract/abstractBaseDataEntity.dart';

class Alarm extends AbstractBaseDataEntity {
  final String description;
  final DateTime? dateToWakeUp;
  final int active;

//<editor-fold desc="Data Methods">

  Alarm(
      {id,
      required this.description,
      required this.dateToWakeUp,
      required this.active,
      createdAt,
      createdBy,
      updatedAt,
      updatedBy})
      : super(createdAt, createdBy, updatedAt, updatedBy, id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alarm &&
          runtimeType == other.runtimeType &&
          description == other.description &&
          dateToWakeUp == other.dateToWakeUp &&
          active == other.active &&
          id == other.id);

  @override
  int get hashCode =>
      description.hashCode ^
      dateToWakeUp.hashCode ^
      active.hashCode ^
      id.hashCode;

  @override
  String toString() {
    return 'Alarm{' +
        ' description: $description,' +
        ' dateToWakeUp: $dateToWakeUp,' +
        ' active: $active,' +
        ' id: $id,' +
        '}';
  }

  Alarm copyWith({
    String? description,
    DateTime? dateToWakeUp,
    int? active,
    int? id,
  }) {
    return Alarm(
      description: description ?? this.description,
      dateToWakeUp: dateToWakeUp ?? this.dateToWakeUp,
      active: active ?? this.active,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'description': this.description,
      'dateToWakeUp': this.dateToWakeUp.toString(),
      'active': this.active,
    };
  }

  @override
  fromMap(Map<String, dynamic> map) {
    return Alarm(
      description: map['description'] as String,
      dateToWakeUp: map['dateToWakeUp'] as DateTime,
      active: map['active'] as int,
      id: map['id'] as int,
    );
  }

  factory Alarm.fromMap(Map<String, dynamic> map) {
    return Alarm(
      description: map['description'] as String,
      dateToWakeUp: map['dateToWakeUp'] as DateTime,
      active: map['active'] as int,
    );
  }

//</editor-fold>
}
