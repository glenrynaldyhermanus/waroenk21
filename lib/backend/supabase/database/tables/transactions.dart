import '../database.dart';

class TransactionsTable extends SupabaseTable<TransactionsRow> {
  @override
  String get tableName => 'transactions';

  @override
  TransactionsRow createRow(Map<String, dynamic> data) => TransactionsRow(data);
}

class TransactionsRow extends SupabaseDataRow {
  TransactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TransactionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get transactionNo => getField<String>('transaction_no');
  set transactionNo(String? value) => setField<String>('transaction_no', value);

  int? get preOrderId => getField<int>('pre_order_id');
  set preOrderId(int? value) => setField<int>('pre_order_id', value);

  double? get total => getField<double>('total');
  set total(double? value) => setField<double>('total', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime get paidAt => getField<DateTime>('paid_at')!;
  set paidAt(DateTime value) => setField<DateTime>('paid_at', value);

  bool? get isPaid => getField<bool>('is_paid');
  set isPaid(bool? value) => setField<bool>('is_paid', value);

  String? get paymentMethod => getField<String>('payment_method');
  set paymentMethod(String? value) => setField<String>('payment_method', value);
}
