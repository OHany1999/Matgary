import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/utils/enum.dart';
import 'package:matgary/login/domain/usecase/get_login_usecase.dart';
import 'package:matgary/login/presentation/controller/login_event.dart';
import 'package:matgary/login/presentation/controller/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginUseCase getLoginUseCase;

  LoginBloc(this.getLoginUseCase) : super(const LoginState()) {
    on<GetLoginEvent>(_getNowLogin);
  }

  FutureOr<void> _getNowLogin(GetLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await getLoginUseCase(LoginParameters(email: event.email, password: event.password));
    result.fold(
      (l) => emit(state.copyWith(loginMessage: l.message,requestState: RequestState.error)),
      (r) => emit(state.copyWith(loginEntity: r,requestState: RequestState.success)),
    );
  }
}
