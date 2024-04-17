import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/login/domain/usecase/get_login_usecase.dart';
import 'package:matgary/login/presentation/controller/login_event.dart';
import 'package:matgary/login/presentation/controller/login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginUseCase getLoginUseCase;

  LoginBloc(this.getLoginUseCase) : super(const LoginState()){
    on<GetLoginEvent>(_getNowLogin);
  }



  FutureOr<void> _getNowLogin(GetLoginEvent event, Emitter<LoginState> emit) async{
    final result = await getLoginUseCase(LoginParameters(email: event.email, password: event.password));


  }


}

