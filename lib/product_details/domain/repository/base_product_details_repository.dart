import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/login/domain/entities/login_entity.dart';
import 'package:matgary/login/domain/usecase/get_login_usecase.dart';

abstract class BaseLoginRepository{

Future<Either<Failure,LoginEntity>> getLoginData(LoginParameters loginParameters);

}