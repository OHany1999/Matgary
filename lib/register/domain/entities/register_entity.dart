import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable{
  final bool? status;
  final String? message;
  final RegisterDataEntity? data;

  const RegisterEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];

}

class RegisterDataEntity extends Equatable{
  final String? name;
  final String? phone;
  final String? email;
  final int? id;
  final String? image;
  final String? token;

  const RegisterDataEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name,phone,email,id,image,token];

}
