import 'package:matgary/login/domain/entities/login_entity.dart';

abstract class BaseLoginRepository{

Future<LoginEntity> getLoginData();

}