// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartProductStruct extends BaseStruct {
  CartProductStruct({
    int? productId,
    int? quantity,
    String? productName,
    double? price,
  })  : _productId = productId,
        _quantity = quantity,
        _productName = productName,
        _price = price;

  // "product_id" field.
  int? _productId;
  int get productId => _productId ?? 0;
  set productId(int? val) => _productId = val;
  void incrementProductId(int amount) => _productId = productId + amount;
  bool hasProductId() => _productId != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;
  bool hasProductName() => _productName != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static CartProductStruct fromMap(Map<String, dynamic> data) =>
      CartProductStruct(
        productId: castToType<int>(data['product_id']),
        quantity: castToType<int>(data['quantity']),
        productName: data['product_name'] as String?,
        price: castToType<double>(data['price']),
      );

  static CartProductStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartProductStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'product_id': _productId,
        'quantity': _quantity,
        'product_name': _productName,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_id': serializeParam(
          _productId,
          ParamType.int,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'product_name': serializeParam(
          _productName,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static CartProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartProductStruct(
        productId: deserializeParam(
          data['product_id'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        productName: deserializeParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CartProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartProductStruct &&
        productId == other.productId &&
        quantity == other.quantity &&
        productName == other.productName &&
        price == other.price;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([productId, quantity, productName, price]);
}

CartProductStruct createCartProductStruct({
  int? productId,
  int? quantity,
  String? productName,
  double? price,
}) =>
    CartProductStruct(
      productId: productId,
      quantity: quantity,
      productName: productName,
      price: price,
    );
