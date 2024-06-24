import 'package:equatable/equatable.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';

enum RegisterRequestState {
  initial,
  loading,
  success,
  error,
}

class RegisterState extends Equatable {
  final SuccessEntity? successEntity;
  final RegisterRequestState registerRequestState;
  final String registerErrorMessage;

  const RegisterState({
    this.successEntity,
    this.registerRequestState = RegisterRequestState.initial,
    this.registerErrorMessage = '',
  });

  RegisterState copyWith({
    SuccessEntity? successEntity,
    RegisterRequestState? registerRequestState,
    String? registerErrorMessage,
  }) {
    return RegisterState(
      successEntity: successEntity ?? this.successEntity,
      registerRequestState: registerRequestState ?? this.registerRequestState,
      registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        successEntity,
        registerRequestState,
        registerErrorMessage,
      ];
}
