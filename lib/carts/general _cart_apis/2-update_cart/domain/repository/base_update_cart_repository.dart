import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/entities/update_cart_entity.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/usecase/update_cart_usecase.dart';
import 'package:matgary/core/error/failure.dart';

abstract class BaseUpdateCartRepository{
  Future<Either<Failure,UpdateCartEntity>> getUpdateCartData(UpdateCartParameters Parameters);
}
