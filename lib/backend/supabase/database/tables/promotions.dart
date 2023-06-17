import '../database.dart';

class PromotionsTable extends SupabaseTable<PromotionsRow> {
  @override
  String get tableName => 'promotions';

  @override
  PromotionsRow createRow(Map<String, dynamic> data) => PromotionsRow(data);
}

class PromotionsRow extends SupabaseDataRow {
  PromotionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PromotionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get body => getField<String>('body');
  set body(String? value) => setField<String>('body', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);
}
