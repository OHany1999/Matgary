import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/favorite/data/datasource/favorite_list_remote_data_source.dart';
import 'package:matgary/favorite/domain/entities/delete_favorite_entity.dart';
import 'package:matgary/favorite/domain/entities/favorite_list_entity.dart';
import 'package:matgary/favorite/domain/repository/base_favorite_list_repository.dart';

class FavoriteListRepository extends BaseFavoriteListRepository {
  final BaseFavoriteListRemoteDataSource baseFavoriteListRemoteDataSource;

  FavoriteListRepository(this.baseFavoriteListRemoteDataSource);

  @override
  Future<Either<Failure, FavoriteListEntity>> getFavoriteListData() async{
    try {
      final result = await baseFavoriteListRemoteDataSource.getFavoriteListData();
      return Right(result);
    } on Exception catch (error) {
      return left(Failure(error.hashCode, error.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteFavoriteEntity>> deleteFavoriteData(int id)async {
   try{
     final result = await baseFavoriteListRemoteDataSource.deleteFavoriteData(id);
     return Right(result);
   }on Exception catch (error) {
     return left(Failure(error.hashCode, error.toString()));
   }

  }

}