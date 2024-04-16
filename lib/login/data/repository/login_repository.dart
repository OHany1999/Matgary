import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/exceptions.dart';
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
    final result = await baseLoginRemoteDataSource.getLoginData(loginParameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }


}