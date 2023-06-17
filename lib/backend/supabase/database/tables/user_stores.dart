import '../database.dart';

class UserStoresTable extends SupabaseTable<UserStoresRow> {
  @override
  String get tableName => 'user_stores';

  @override
  UserStoresRow createRow(Map<String, dynamic> data) => UserStoresRow(data);
}

class UserStoresRow extends SupabaseDataRow {
  UserStoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserStoresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userUuid => getField<String>('user_uuid');
  set userUuid(String? value) => setField<String>('user_uuid', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
