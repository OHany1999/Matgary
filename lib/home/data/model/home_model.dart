import 'dart:math';

import 'package:matgary/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      );
}

class DataModel extends DataEntity {
  DataModel({
    required super.banners,
    required super.products,
    required super.ad,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        banners: json['banners'] != null
            ? List<BannersModel>.from(json['banners']
                .map((element) => BannersModel.fromJson(element)))
            : null,
        products: json['products'] != null
            ? List<ProductsModel>.from(json['products']
                .map((element) => ProductsModel.fromJson(element)))
            : null,
        ad: json['ad'],
      );
}

class BannersModel extends BannersEntity {
  BannersModel({
    required super.id,
    required super.image,
    required super.category,
    required super.product,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        id: json['id'],
        image: json['image'],
        category: json['category'],
        product: json['product'],
      );
}

class ProductsModel extends ProductsEntity {
  ProductsModel({
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

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['oldPrice'].toInt(),
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
        images: json['images'],
        inFavorites: json['inFavorites'],
        inCart: json['inCart'],
      );
}
