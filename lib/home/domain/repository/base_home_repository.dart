import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/product_details/domain/entities/add_favorite_entity.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';

abstract class BaseHomeRepository{
  Future<Either<Failure,HomeEntity>> getHomeData();
  Future<Either<Failure,AddFavoriteEntity>> addFavoriteData();
}