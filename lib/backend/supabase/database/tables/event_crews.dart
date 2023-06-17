import '../database.dart';

class EventCrewsTable extends SupabaseTable<EventCrewsRow> {
  @override
  String get tableName => 'event_crews';

  @override
  EventCrewsRow createRow(Map<String, dynamic> data) => EventCrewsRow(data);
}

class EventCrewsRow extends SupabaseDataRow {
  EventCrewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventCrewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get eventId => getField<int>('event_id')!;
  set eventId(int value) => setField<int>('event_id', value);

  bool? get isPic => getField<bool>('is_pic');
  set isPic(bool? value) => setField<bool>('is_pic', value);

  int get roleId => getField<int>('role_id')!;
  set roleId(int value) => setField<int>('role_id', value);
}
