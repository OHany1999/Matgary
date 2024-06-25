import 'package:equatable/equatable.dart';
import 'package:matgary/register/domain/entities/register_entity.dart';


enum RegisterRequestState {
  initial,
  loading,
  success,
  error,
}

class RegisterState extends Equatable {
  final RegisterEntity? registerEntity;
  final RegisterRequestState registerRequestState;
  final String registerErrorMessage;

  const RegisterState({
    this.registerEntity,
    this.registerRequestState = RegisterRequestState.initial,
    this.registerErrorMessage = '',
  });

  RegisterState copyWith({
    RegisterEntity? RegisterEntity,
    RegisterRequestState? registerRequestState,
    String? registerErrorMessage,
  }) {
    return RegisterState(
      registerEntity: RegisterEntity ?? this.registerEntity,
      registerRequestState: registerRequestState ?? this.registerRequestState,
      registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        RegisterEntity,
        registerRequestState,
        registerErrorMessage,
      ];
}

