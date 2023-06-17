import '../database.dart';

class PreOrdersTable extends SupabaseTable<PreOrdersRow> {
  @override
  String get tableName => 'pre_orders';

  @override
  PreOrdersRow createRow(Map<String, dynamic> data) => PreOrdersRow(data);
}

class PreOrdersRow extends SupabaseDataRow {
  PreOrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PreOrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get readyAt => getField<DateTime>('ready_at');
  set readyAt(DateTime? value) => setField<DateTime>('ready_at', value);

  DateTime? get openOrderAt => getField<DateTime>('open_order_at');
  set openOrderAt(DateTime? value) =>
      setField<DateTime>('open_order_at', value);

  DateTime? get closeOrderAt => getField<DateTime>('close_order_at');
  set closeOrderAt(DateTime? value) =>
      setField<DateTime>('close_order_at', value);

  int? get minQuota => getField<int>('min_quota');
  set minQuota(int? value) => setField<int>('min_quota', value);

  int? get maxQuota => getField<int>('max_quota');
  set maxQuota(int? value) => setField<int>('max_quota', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get storeId => getField<int>('store_id');
  set storeId(int? value) => setField<int>('store_id', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);
}
