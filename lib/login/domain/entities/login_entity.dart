import 'package:equatable/equatable.dart';
import 'package:matgary/login/domain/entities/data_login_entity.dart';

class LoginEntity extends Equatable {
  final bool status;
  final String message;
  final DataLoginEntity data;

  const LoginEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];
}
