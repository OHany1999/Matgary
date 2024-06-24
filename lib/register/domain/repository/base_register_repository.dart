import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/register/domain/entities/register_entity.dart';
import 'package:matgary/register/domain/usecase/register_usecase.dart';

abstract class BaseRegisterRepository{
  Future<Either<Failure,RegisterEntity>> getRegisterData(RegisterParameters parameters);
}
