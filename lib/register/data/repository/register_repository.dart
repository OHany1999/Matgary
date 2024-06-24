import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/register/data/datasource/register_datasource.dart';
import 'package:matgary/register/domain/entities/register_entity.dart';
import 'package:matgary/register/domain/repository/base_register_repository.dart';
import 'package:matgary/register/domain/usecase/register_usecase.dart';

class RegisterRepository extends BaseRegisterRepository{
  final BaseRegisterRemoteDataSource baseRegisterRemoteDataSource;

  RegisterRepository(this.baseRegisterRemoteDataSource);

  @override
  Future<Either<Failure, RegisterEntity>> getRegisterData(RegisterParameters parameters)async {
  try{
  final result = await baseRegisterRemoteDataSource.getRegisterData(parameters);
  return Right(result);
  }on Exception catch(error){
  return left(Failure(error.hashCode, error.toString()));
  }
  }
}