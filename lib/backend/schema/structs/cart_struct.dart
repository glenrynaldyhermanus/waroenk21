// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartStruct extends BaseStruct {
  CartStruct({
    List<CartProductStruct>? products,
  }) : _products = products;

  // "products" field.
  List<CartProductStruct>? _products;
  List<CartProductStruct> get products => _products ?? const [];
  set products(List<CartProductStruct>? val) => _products = val;
  void updateProducts(Function(List<CartProductStruct>) updateFn) =>
      updateFn(_products ??= []);
  bool hasProducts() => _products != null;

  static CartStruct fromMap(Map<String, dynamic> data) => CartStruct(
        products: getStructList(
          data['products'],
          CartProductStruct.fromMap,
        ),
      );

  static CartStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'products': _products?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'products': serializeParam(
          _products,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartStruct(
        products: deserializeStructParam<CartProductStruct>(
          data['products'],
          ParamType.DataStruct,
          true,
          structBuilder: CartProductStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartStruct && listEquality.equals(products, other.products);
  }

  @override
  int get hashCode => const ListEquality().hash([products]);
}

CartStruct createCartStruct() => CartStruct();
