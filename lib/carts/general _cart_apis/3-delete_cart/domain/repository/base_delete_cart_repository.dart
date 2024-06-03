
import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/usecase/delete_cart_usecase.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/upate_and_remove_cart_entity.dart';

abstract class BaseDeleteCartRepository{
  Future<Either<Failure,UpdateAndDeleteCartEntity>> getDeleteCartData(DeleteCartParameters parameters);
}