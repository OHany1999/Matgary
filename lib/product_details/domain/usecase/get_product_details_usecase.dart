import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/login/domain/entities/login_entity.dart';
import 'package:matgary/login/domain/repository/base_login_repository.dart';

class GetLoginUseCase extends BaseUseCase<LoginEntity, LoginParameters> {
  final BaseLoginRepository baseLoginRepository;

  GetLoginUseCase(this.baseLoginRepository);

  @override
  Future<Either<Failure,LoginEntity>> call(LoginParameters loginParameters)async {
    return await baseLoginRepository.getLoginData(loginParameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
