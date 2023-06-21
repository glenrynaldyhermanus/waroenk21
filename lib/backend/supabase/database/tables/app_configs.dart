import '../database.dart';

class AppConfigsTable extends SupabaseTable<AppConfigsRow> {
  @override
  String get tableName => 'app_configs';

  @override
  AppConfigsRow createRow(Map<String, dynamic> data) => AppConfigsRow(data);
}

class AppConfigsRow extends SupabaseDataRow {
  AppConfigsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppConfigsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool get value => getField<bool>('value')!;
  set value(bool value) => setField<bool>('value', value);
}
