import 'package:matgary/product_details/domain/entities/add_favorite_entity.dart';

class AddFavoriteModel extends AddFavoriteEntity {
  const AddFavoriteModel({required super.status, required super.message});

  factory AddFavoriteModel.fromJson(Map<String, dynamic> json) =>
      AddFavoriteModel(
        status: json['status'],
        message: json['message'],
      );
}
