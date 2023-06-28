import '../database.dart';

class ActivityGroupsTable extends SupabaseTable<ActivityGroupsRow> {
  @override
  String get tableName => 'activity_groups';

  @override
  ActivityGroupsRow createRow(Map<String, dynamic> data) =>
      ActivityGroupsRow(data);
}

class ActivityGroupsRow extends SupabaseDataRow {
  ActivityGroupsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivityGroupsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get brief => getField<String>('brief');
  set brief(String? value) => setField<String>('brief', value);

  int get eventId => getField<int>('event_id')!;
  set eventId(int value) => setField<int>('event_id', value);
}
