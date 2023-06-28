import '../database.dart';

class ActivitiesTable extends SupabaseTable<ActivitiesRow> {
  @override
  String get tableName => 'activities';

  @override
  ActivitiesRow createRow(Map<String, dynamic> data) => ActivitiesRow(data);
}

class ActivitiesRow extends SupabaseDataRow {
  ActivitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  int? get eventId => getField<int>('event_id');
  set eventId(int? value) => setField<int>('event_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);

  int? get typeId => getField<int>('type_id');
  set typeId(int? value) => setField<int>('type_id', value);

  DateTime get startDate => getField<DateTime>('start_date')!;
  set startDate(DateTime value) => setField<DateTime>('start_date', value);

  int get minParticipants => getField<int>('min_participants')!;
  set minParticipants(int value) => setField<int>('min_participants', value);

  int get maxParticipants => getField<int>('max_participants')!;
  set maxParticipants(int value) => setField<int>('max_participants', value);

  bool get isPublic => getField<bool>('is_public')!;
  set isPublic(bool value) => setField<bool>('is_public', value);

  String get location => getField<String>('location')!;
  set location(String value) => setField<String>('location', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);

  DateTime get endDate => getField<DateTime>('end_date')!;
  set endDate(DateTime value) => setField<DateTime>('end_date', value);
}
