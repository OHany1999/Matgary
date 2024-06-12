import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/data/datasource/add_order_datasource.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/domain/entities/add_order_entity.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/domain/repository/base_add_order_repository.dart';
import 'package:matgary/core/error/failure.dart';

class AddOrderRepository extends BaseAddOrderRepository{
  final BaseAddOrderRemoteDataSource baseAddOrderRemoteDataSource;

  AddOrderRepository(this.baseAddOrderRemoteDataSource);

  @override
  Future<Either<Failure, AddOrderEntity>> getAddOrderData()async {
  try{
  final result = await baseAddOrderRemoteDataSource.getAddOrderData();
  return Right(result);
  }on Exception catch(error){
  return left(Failure(error.hashCode, error.toString()));
  }
  }
}