import 'package:equatable/equatable.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/login/domain/entities/login_entity.dart';

class LoginState extends Equatable {
  final LoginEntity? loginEntity;
  final RequestState requestState;
  final String loginMessage;


  const LoginState({
    this.loginEntity,
    this.requestState = RequestState.initial,
    this.loginMessage = '',
  });


  LoginState copyWith({
    LoginEntity? loginEntity,
    RequestState? requestState,
    String? loginMessage,
  }) {
    return LoginState(
      loginEntity: loginEntity ?? this.loginEntity,
      requestState: requestState ?? this.requestState,
      loginMessage: loginMessage ?? this.loginMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [loginEntity, requestState, loginMessage];
}

/////////////////////////////////////////////////

class PasswordObscureState extends Equatable {
  final bool obscurePassword ;


  const PasswordObscureState({this.obscurePassword = true});



  @override
  // TODO: implement props
  List<Object?> get props => [obscurePassword];
}



