import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class GetRegisterEvent extends RegisterEvent {
  final String name;
  final String phone;
  final String email;
  final String password;

  GetRegisterEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name,phone,email,password];
}
