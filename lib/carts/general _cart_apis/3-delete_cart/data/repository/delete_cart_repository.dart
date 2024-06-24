import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/data/datasource/delete_cart_datasource.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/repository/base_delete_cart_repository.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/usecase/delete_cart_usecase.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';

class DeleteCartRepository extends BaseDeleteCartRepository{
  final BaseDeleteCartRemoteDataSource baseDeleteCartRemoteDataSource;

  DeleteCartRepository(this.baseDeleteCartRemoteDataSource);

  @override
  Future<Either<Failure, SuccessEntity>> getDeleteCartData(DeleteCartParameters parameters)async {
  try{
  final result = await baseDeleteCartRemoteDataSource.getDeleteCartData(parameters);
  return Right(result);
  }on Exception catch(error){
  return left(Failure(error.hashCode, error.toString()));
  }
  }
}
