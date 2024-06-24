import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/register/domain/usecase/register_usecase.dart';
import 'package:matgary/register/presentation/controller/register_bloc/register_event.dart';
import 'package:matgary/register/presentation/controller/register_bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(const RegisterState()) {
    on<GetRegisterEvent>(_getRegister);
  }

  FutureOr<void> _getRegister(
      GetRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(registerRequestState: RegisterRequestState.loading));

    final result = await registerUseCase(RegisterParameters(name: event.name, phone: event.phone, email: event.email, password: event.password));
    result.fold(
      (l) => emit(state.copyWith(
          registerErrorMessage: l.message,
          registerRequestState: RegisterRequestState.error)),
      (r) => emit(state.copyWith(
          successEntity: r,
          registerRequestState: RegisterRequestState.success)),
    );
  }
}
