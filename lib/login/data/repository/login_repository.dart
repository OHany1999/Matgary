import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/error_handler.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/login/data/datasource/login_remote_data_source.dart';
import 'package:matgary/login/domain/entities/login_entity.dart';
import 'package:matgary/login/domain/repository/base_login_repository.dart';
import 'package:matgary/login/domain/usecase/get_login_usecase.dart';

class LoginRepository extends BaseLoginRepository{
final BaseLoginRemoteDataSource baseLoginRemoteDataSource;


  LoginRepository(this.baseLoginRemoteDataSource);

  @override
  Future<Either<Failure, LoginEntity>> getLoginData(LoginParameters loginParameters) async{
    try{
      final result = await baseLoginRemoteDataSource.getLoginData(loginParameters);
      return Right(result);
    }catch (error){
      return Left(ErrorHandler.handle(error).failure);
    }

  }


}