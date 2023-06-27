import '../database.dart';

class AppVersionsTable extends SupabaseTable<AppVersionsRow> {
  @override
  String get tableName => 'app_versions';

  @override
  AppVersionsRow createRow(Map<String, dynamic> data) => AppVersionsRow(data);
}

class AppVersionsRow extends SupabaseDataRow {
  AppVersionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppVersionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  double get number => getField<double>('number')!;
  set number(double value) => setField<double>('number', value);

  bool get isForceUpdate => getField<bool>('is_force_update')!;
  set isForceUpdate(bool value) => setField<bool>('is_force_update', value);

  String? get whatsNew => getField<String>('whats_new');
  set whatsNew(String? value) => setField<String>('whats_new', value);
}
