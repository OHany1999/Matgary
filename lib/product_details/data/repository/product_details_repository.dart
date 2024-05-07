import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/product_details/data/datasource/product_details_remote_data_source.dart';
import 'package:matgary/product_details/domain/entities/add_favorite_entity.dart';
import 'package:matgary/product_details/domain/entities/home_details_entity.dart';
import 'package:matgary/product_details/domain/repository/base_product_details_repository.dart';
import 'package:matgary/product_details/domain/usecase/add_favorite_usecase.dart';
import 'package:matgary/product_details/domain/usecase/get_product_details_usecase.dart';

class ProductDetailsRepository extends BaseProductDetailsRepository{
final BaseProductDetailsRemoteDataSource baseProductDetailsRemoteDataSource;


ProductDetailsRepository(this.baseProductDetailsRemoteDataSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetailsData(ProductDetailsParameters productDetailsParameters)async {
    try{
      final result = await baseProductDetailsRemoteDataSource.getProductDetailsData(productDetailsParameters);
      return Right(result);
    }catch (error){
      return left(Failure(error.hashCode, error.toString()));
    }
  }

  @override
  Future<Either<Failure, AddFavoriteEntity>> addFavoriteData(AddFavoriteParameters addFavoriteParameters)async {
    try{
      final result = await baseProductDetailsRemoteDataSource.getAddFavoriteData(addFavoriteParameters);
      return Right(result);

    }catch(error){
      return Left(Failure(error.hashCode, error.toString()));
    }

  }


}