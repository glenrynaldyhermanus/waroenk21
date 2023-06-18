import '../database.dart';

class EventRolesTable extends SupabaseTable<EventRolesRow> {
  @override
  String get tableName => 'event_roles';

  @override
  EventRolesRow createRow(Map<String, dynamic> data) => EventRolesRow(data);
}

class EventRolesRow extends SupabaseDataRow {
  EventRolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventRolesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get level => getField<int>('level')!;
  set level(int value) => setField<int>('level', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int get eventId => getField<int>('event_id')!;
  set eventId(int value) => setField<int>('event_id', value);

  bool get canAddCrew => getField<bool>('can_add_crew')!;
  set canAddCrew(bool value) => setField<bool>('can_add_crew', value);

  bool get isEditable => getField<bool>('is_editable')!;
  set isEditable(bool value) => setField<bool>('is_editable', value);

  bool get canAddActivity => getField<bool>('can_add_activity')!;
  set canAddActivity(bool value) => setField<bool>('can_add_activity', value);
}
