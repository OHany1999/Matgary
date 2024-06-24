import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';
import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/register/domain/repository/base_register_repository.dart';

class RegisterUseCase extends BaseUseCase<SuccessEntity, RegisterParameters> {
  final BaseRegisterRepository baseRegisterRepository;

  RegisterUseCase(this.baseRegisterRepository);

  @override
  Future<Either<Failure, SuccessEntity>> call(RegisterParameters parameters) async {
    return await baseRegisterRepository.getRegisterData(parameters);
  }
}

class RegisterParameters extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;

  const RegisterParameters(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password});

  @override
  List<Object?> get props => [name, phone, email, password];
}
