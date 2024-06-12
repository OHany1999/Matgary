import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/domain/entities/add_order_entity.dart';
import 'package:matgary/core/error/failure.dart';

abstract class BaseAddOrderRepository{
  Future<Either<Failure,AddOrderEntity>> getAddOrderData();
}