import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  List<Object?> get props => [];
}

class GetLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const GetLoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}
