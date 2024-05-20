import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/favorite/domain/entities/delete_favorite_entity.dart';
import 'package:matgary/favorite/domain/entities/favorite_list_entity.dart';

abstract class BaseFavoriteListRepository{
Future<Either<Failure,FavoriteListEntity>> getFavoriteListData();
Future<Either<Failure,DeleteFavoriteEntity>> deleteFavoriteData(int id);
}
