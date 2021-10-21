import 'abstract/abstractBaseDataEntity.dart';

class User extends AbstractBaseDataEntity {
  final String nom;
  final String prenom;
  final int active;

//<editor-fold desc="Data Methods">

  User(
      {required this.nom,
      required this.prenom,
      required this.active,
      id,
      createdAt,
      createdBy,
      updatedAt,
      updatedBy})
      : super(createdAt, createdBy, updatedAt, updatedBy, id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          nom == other.nom &&
          prenom == other.prenom &&
          active == other.active &&
          id == other.id);

  @override
  int get hashCode => nom.hashCode ^ prenom.hashCode ^ active.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' nom: $nom,' +
        ' prenom: $prenom,' +
        ' active: $active,' +
        '}';
  }

  User copyWith({
    int? id,
    String? nom,
    String? prenom,
    int? active,
  }) {
    return User(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nom': this.nom,
      'prenom': this.prenom,
      'active': this.active,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      active: map['active'] as int,
    );
  }

  @override
  fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

//</editor-fold>
}
