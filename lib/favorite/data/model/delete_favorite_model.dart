import 'package:matgary/favorite/domain/entities/delete_favorite_entity.dart';

class DeleteFavoriteModel extends DeleteFavoriteEntity {
  const DeleteFavoriteModel({required super.status, required super.message});

  factory DeleteFavoriteModel.fromJson(Map<String, dynamic> json) =>
      DeleteFavoriteModel(
        status: json['status'],
        message: json['message'],
      );
}
