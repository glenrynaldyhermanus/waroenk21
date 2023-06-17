import '../database.dart';

class EventsTable extends SupabaseTable<EventsRow> {
  @override
  String get tableName => 'events';

  @override
  EventsRow createRow(Map<String, dynamic> data) => EventsRow(data);
}

class EventsRow extends SupabaseDataRow {
  EventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);
}
