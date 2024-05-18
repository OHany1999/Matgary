import 'package:matgary/favorite/domain/entities/favorite_list_entity.dart';

class FavoriteListModel extends FavoriteListEntity {
  FavoriteListModel(
      {required super.status, required super.message, required super.data});

  factory FavoriteListModel.formJson(Map<String, dynamic> json) =>
      FavoriteListModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null
            ? DataListModel.fromJson(json['data'])
            : null,
      );
}

class DataListModel extends DataListEntity {
  DataListModel({required super.data, required super.total});

  factory DataListModel.fromJson(Map<String, dynamic> json) =>
      DataListModel(
        data: json['data'] != null ? List<DataModel>.from(
            json['data'].map((element) => DataModel.fromJson(element)))
            : null,
        total: json['total'],
      );
}

class DataModel extends DataEntity {
  DataModel({required super.id, required super.product});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel(
          id: json['id'],
          product: json['product'] != null ? ProductModel.fromJson(json['product']) : null,
      );
}


class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id, required super.name, required super.description, required super.discount, required super.image, required super.price, required super.oldPrice,});

  factory ProductModel.fromJson(Map<String, dynamic> json)=>
      ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        discount: json['discount'],
        image: json['image'],
        price: json['price'],
        oldPrice: json['old_price'],
      );
}