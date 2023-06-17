import '../database.dart';

class SectionsTable extends SupabaseTable<SectionsRow> {
  @override
  String get tableName => 'sections';

  @override
  SectionsRow createRow(Map<String, dynamic> data) => SectionsRow(data);
}

class SectionsRow extends SupabaseDataRow {
  SectionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SectionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
