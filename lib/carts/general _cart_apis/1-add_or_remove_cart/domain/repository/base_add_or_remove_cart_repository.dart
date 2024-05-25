import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/domain/entities/add_or_remove_cart_entity.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/domain/usecase/add_or_remove_cart_usecase.dart';
import 'package:matgary/core/error/failure.dart';

abstract class BaseAddOrRemoveCartRepository{
  Future<Either<Failure,AddOrRemoveCartEntity>> getAddOrRemoveCartData(AddOrRemoveCartParameters addOrRemoveCartParameters);
}
