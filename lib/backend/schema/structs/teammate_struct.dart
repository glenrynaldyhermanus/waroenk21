// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeammateStruct extends BaseStruct {
  TeammateStruct({
    String? name,
    String? email,
    bool? isLeader,
    int? id,
  })  : _name = name,
        _email = email,
        _isLeader = isLeader,
        _id = id;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "is_leader" field.
  bool? _isLeader;
  bool get isLeader => _isLeader ?? false;
  set isLeader(bool? val) => _isLeader = val;
  bool hasIsLeader() => _isLeader != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  static TeammateStruct fromMap(Map<String, dynamic> data) => TeammateStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        isLeader: data['is_leader'] as bool?,
        id: castToType<int>(data['id']),
      );

  static TeammateStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TeammateStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'is_leader': _isLeader,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'is_leader': serializeParam(
          _isLeader,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static TeammateStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeammateStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        isLeader: deserializeParam(
          data['is_leader'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TeammateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeammateStruct &&
        name == other.name &&
        email == other.email &&
        isLeader == other.isLeader &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([name, email, isLeader, id]);
}

TeammateStruct createTeammateStruct({
  String? name,
  String? email,
  bool? isLeader,
  int? id,
}) =>
    TeammateStruct(
      name: name,
      email: email,
      isLeader: isLeader,
      id: id,
    );
