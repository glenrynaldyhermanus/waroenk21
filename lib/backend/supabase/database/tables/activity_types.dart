import '../database.dart';

class ActivityTypesTable extends SupabaseTable<ActivityTypesRow> {
  @override
  String get tableName => 'activity_types';

  @override
  ActivityTypesRow createRow(Map<String, dynamic> data) =>
      ActivityTypesRow(data);
}

class ActivityTypesRow extends SupabaseDataRow {
  ActivityTypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivityTypesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
