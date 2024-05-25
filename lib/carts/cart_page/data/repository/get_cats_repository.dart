import 'package:dartz/dartz.dart';
import 'package:matgary/carts/cart_page/data/datasource/get_cart_datasource.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';
import 'package:matgary/carts/cart_page/domain/repository/base_get_cart_repository.dart';
import 'package:matgary/core/error/failure.dart';

class GetCartRepository extends BaseGetCartRepository{
  final BaseGetCartRemoteDataSource baseGetCartRemoteDataSource;

  GetCartRepository(this.baseGetCartRemoteDataSource);

  @override
  Future<Either<Failure, GetCartEntity>> getCartData()async {
    try{
      final result = await baseGetCartRemoteDataSource.getCartData();
      return Right(result);
    }on Exception catch(error){
      return left(Failure(error.hashCode, error.toString()));
    }
  }
}