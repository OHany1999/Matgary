import 'package:dartz/dartz.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';
import 'package:matgary/core/error/failure.dart';

abstract class BaseGetCartRepository{
  Future<Either<Failure,GetCartEntity>> getCartData();
}
