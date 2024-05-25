import 'package:matgary/cards/cart_page/domain/entities/get_cart_entity.dart';

class GetCartModel extends GetCartEntity {
  GetCartModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) =>
      GetCartModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? GetCartDataModel.fromJson(json["data"])
            : null,
      );
}

class GetCartDataModel extends GetCartDataEntity {
  GetCartDataModel({
    required super.cartItems,
    required super.subTotal,
    required super.total,
  });

  factory GetCartDataModel.fromJson(Map<String, dynamic> json) =>
      GetCartDataModel(
        cartItems: json['cart_items'] != null ? List<CartItemModel>.from(
            json['cart_items'].map((element) =>
                CartItemModel.fromJson(element)))
            : null,
        subTotal: json["sub_total"],
        total: json["total"],
      );
}

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.id,
    required super.quantity,
    required super.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      CartItemModel(
          id: json["id"],
          quantity: json["quantity"],
          product: json["product"] != null ? ProductModel.fromJson(json["product"]) : null,
      );
}


class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id, required super.price, required super.oldPrice, required super.discount, required super.image, required super.name, required super.description, required super.images, required super.inFavorites, required super.inCart,});


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    price: json["price"],
    oldPrice: json["old_price"],
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: json["images"] != null? List<String>.from(json["images"].map((x) => x)): null,
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );
}