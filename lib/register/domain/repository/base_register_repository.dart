import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';
import 'package:matgary/register/domain/usecase/register_usecase.dart';

abstract class BaseRegisterRepository{
  Future<Either<Failure,SuccessEntity>> getRegisterData(RegisterParameters parameters);
}
