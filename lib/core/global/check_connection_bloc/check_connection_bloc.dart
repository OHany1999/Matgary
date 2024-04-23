import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/global/check_connection_bloc/check_connection_event.dart';
import 'package:matgary/core/global/check_connection_bloc/check_connection_state.dart';
import 'package:matgary/core/network/netword_info.dart';


class CheckConnectionBloc extends Bloc<CheckConnectionEvent, CheckConnectionState> {
  final NetworkInfo networkInfo;
  CheckConnectionBloc(this.networkInfo):super(const CheckConnectionState()){
   on<CheckConnectionEvent> (_checkConnection);
  }


  // LoginBloc() : super(const LoginState()) {
  //   on<GetLoginEvent>(_getNowLogin);
  //
  // }

  // FutureOr<void> _getNowLogin(GetLoginEvent event, Emitter<LoginState> emit) async {
  //   emit(state.copyWith(requestState: RequestState.loading));
  //   final result = await getLoginUseCase(LoginParameters(email: event.email, password: event.password));
  //   result.fold(
  //     (l) => emit(state.copyWith(loginMessage: l.message,requestState: RequestState.error)),
  //     (r) => emit(state.copyWith(loginEntity: r,requestState: RequestState.success)),
  //   );
  //
  // }


  FutureOr<void> _checkConnection(CheckConnectionEvent event, Emitter<CheckConnectionState> emit) async{
    if(await networkInfo.isConnected){
      emit(CheckConnectionState(isConnected: ConnectionStateTypes.isConnected));
      print('ddddddddddddddddddddd');

    }else{

      emit(CheckConnectionState(isConnected: ConnectionStateTypes.isNotConnected));
      print('ffffffffffffffffffffffff');
    }

  }

}




