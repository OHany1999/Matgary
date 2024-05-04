import 'package:matgary/product_details/domain/entities/home_details_entity.dart';

class HomeDetailsModel extends HomeDetailsEntity {
  HomeDetailsModel(
      {required super.status, required super.message, required super.data,});


  factory HomeDetailsModel.fromJson(Map<String, dynamic> json) =>
      HomeDetailsModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? ProductDetailsModel.fromJson(json['data']) : null,
      );


}



class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.images,
    required super.inFavorites,
    required super.inCart,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    id: json['id'],
    price: json['price'].toDouble(),
    oldPrice: json['old_price'].toDouble(),
    discount: json['discount'],
    image: json['image'],
    name: json['name'],
    description: json['description'],
    images: json['images'],
    inFavorites: json['in_favorites'],
    inCart: json['in_cart'],
  );
}


