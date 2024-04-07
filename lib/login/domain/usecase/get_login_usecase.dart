import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/login/domain/entities/login_entity.dart';
import 'package:matgary/login/domain/repository/base_login_repository.dart';

class GetLoginUseCase extends BaseUseCase<LoginEntity,NoParameters>{
final BaseLoginRepository baseLoginRepository;

  GetLoginUseCase({required this.baseLoginRepository});
  @override
  Future<LoginEntity> call(NoParameters noparameters)async {
    return await baseLoginRepository.getLoginData();
  }

}