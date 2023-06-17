import '../database.dart';

class EventActivitiesTable extends SupabaseTable<EventActivitiesRow> {
  @override
  String get tableName => 'event_activities';

  @override
  EventActivitiesRow createRow(Map<String, dynamic> data) =>
      EventActivitiesRow(data);
}

class EventActivitiesRow extends SupabaseDataRow {
  EventActivitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventActivitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  int get eventId => getField<int>('event_id')!;
  set eventId(int value) => setField<int>('event_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);

  int? get typeId => getField<int>('type_id');
  set typeId(int? value) => setField<int>('type_id', value);
}
