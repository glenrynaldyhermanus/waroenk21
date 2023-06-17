import '../database.dart';

class PreOrdersProductsTable extends SupabaseTable<PreOrdersProductsRow> {
  @override
  String get tableName => 'pre_orders_products';

  @override
  PreOrdersProductsRow createRow(Map<String, dynamic> data) =>
      PreOrdersProductsRow(data);
}

class PreOrdersProductsRow extends SupabaseDataRow {
  PreOrdersProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PreOrdersProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get preOrderId => getField<int>('pre_order_id');
  set preOrderId(int? value) => setField<int>('pre_order_id', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);
}
