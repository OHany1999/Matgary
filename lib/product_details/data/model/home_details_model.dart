import 'package:matgary/product_details/domain/entities/home_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel(
      {required super.status, required super.message, required super.data,});


  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? ProductDataModel.fromJson(json['data']) : null,
      );


}



class ProductDataModel extends ProductDataEntity {
  ProductDataModel({
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

  factory ProductDataModel.fromJson(Map<String, dynamic> json) => ProductDataModel(
    id: json['id'],
    price: json['price'],
    oldPrice: json['old_price'],
    discount: json['discount'],
    image: json['image'],
    name: json['name'],
    description: json['description'],
    images: json['images'],
    inFavorites: json['in_favorites'],
    inCart: json['in_cart'],
  );
}


