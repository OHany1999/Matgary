import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/usecase/update_cart_usecase.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';

abstract class BaseUpdateCartRepository{
  Future<Either<Failure,SuccessEntity>> getUpdateCartData(UpdateCartParameters parameters);
}
