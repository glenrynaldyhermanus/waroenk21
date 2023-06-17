// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileStruct extends BaseStruct {
  ProfileStruct({
    String? uuid,
    String? name,
    String? pictureUrl,
  })  : _uuid = uuid,
        _name = name,
        _pictureUrl = pictureUrl;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;
  bool hasUuid() => _uuid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "picture_url" field.
  String? _pictureUrl;
  String get pictureUrl => _pictureUrl ?? '';
  set pictureUrl(String? val) => _pictureUrl = val;
  bool hasPictureUrl() => _pictureUrl != null;

  static ProfileStruct fromMap(Map<String, dynamic> data) => ProfileStruct(
        uuid: data['uuid'] as String?,
        name: data['name'] as String?,
        pictureUrl: data['picture_url'] as String?,
      );

  static ProfileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProfileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'uuid': _uuid,
        'name': _name,
        'picture_url': _pictureUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'picture_url': serializeParam(
          _pictureUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileStruct(
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        pictureUrl: deserializeParam(
          data['picture_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileStruct &&
        uuid == other.uuid &&
        name == other.name &&
        pictureUrl == other.pictureUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([uuid, name, pictureUrl]);
}

ProfileStruct createProfileStruct({
  String? uuid,
  String? name,
  String? pictureUrl,
}) =>
    ProfileStruct(
      uuid: uuid,
      name: name,
      pictureUrl: pictureUrl,
    );
