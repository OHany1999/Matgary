import 'package:matgary/carts/cart_page/data/model/get_cart_model.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/entities/update_cart_entity.dart';

class UpdateCartModel extends UpdateCartEntity {
  UpdateCartModel(
      {required super.status, required super.message, required super.data});

  factory UpdateCartModel.fromJson(Map<String, dynamic> json) =>
      UpdateCartModel(
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
