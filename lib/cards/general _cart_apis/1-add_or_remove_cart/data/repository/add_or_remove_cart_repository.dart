import 'package:dartz/dartz.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/data/datasource/add_or_remove_cart_datasource.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/domain/entities/add_or_remove_cart_entity.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/domain/repository/base_add_or_remove_cart_repository.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/domain/usecase/add_or_remove_cart_usecase.dart';
import 'package:matgary/core/error/failure.dart';

class AddOrRemoveCartRepository extends BaseAddOrRemoveCartRepository{
  final BaseAddOrRemoveCartRemoteDataSource baseAddOrRemoveCartRemoteDataSource;

  AddOrRemoveCartRepository(this.baseAddOrRemoveCartRemoteDataSource);

  @override
  Future<Either<Failure, AddOrRemoveCartEntity>> getAddOrRemoveCartData(AddOrRemoveCartParameters addOrRemoveCartParameters)async {
  try{
  final result = await baseAddOrRemoveCartRemoteDataSource.getAddOrRemoveCartData(addOrRemoveCartParameters);
  return Right(result);
  }on Exception catch(error){
  return left(Failure(error.hashCode, error.toString()));
  }
  }
}
