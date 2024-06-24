
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';

class SuccessModel extends SuccessEntity {
  SuccessModel(
      {required super.status, required super.message, required super.data});

  factory SuccessModel.fromJson(Map<String, dynamic> json) =>
      SuccessModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      );
}

class DataModel extends DataEntity {
  DataModel(
      {required super.cart, required super.subTotal, required super.total});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    cart: json['cart'] != null ? CartModel.fromJson(json['cart']) : null,
    subTotal: json['sub_total'],
    total: json['total'],
  );
}

class CartModel extends CartEntity {
  CartModel(
      {required super.id, required super.quantity, required super.product});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json['id'],
    quantity: json['quantity'],
    product: json['product'] != null
        ? ProductModel.fromJson(json['product'])
        : null,
  );
}

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
        required super.price,
        required super.oldPrice,
        required super.discount,
        required super.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    price: json['price'],
    oldPrice: json['old_price'],
    discount: json['discount'],
    image: json['image'],
  );
}
