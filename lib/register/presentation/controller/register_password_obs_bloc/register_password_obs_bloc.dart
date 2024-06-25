import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/register/presentation/controller/register_password_obs_bloc/register_password_obs_state.dart';

class PasswordRegisterObsBloc extends Bloc<String, PasswordRegisterObscureState> {
  PasswordRegisterObsBloc():super(const PasswordRegisterObscureState()){
    on<String>(_obscure);

  }




  FutureOr<void> _obscure(String event, Emitter<PasswordRegisterObscureState> emit) {
    if(event == '+') {
      emit(PasswordRegisterObscureState(obscurePassword: !state.obscurePassword));
    }
  }


}

////////////////////////////////////////////////////////////

class PasswordReAddRegisterObsBloc extends Bloc<String, PasswordReAddRegisterObscureState> {
  PasswordReAddRegisterObsBloc():super(const PasswordReAddRegisterObscureState()){
    on<String>(_reAddObscure);

  }




  FutureOr<void> _reAddObscure(String event, Emitter<PasswordReAddRegisterObscureState> emit) {
    if(event == '++') {
      emit(PasswordReAddRegisterObscureState(reAddObscurePassword: !state.reAddObscurePassword));
    }
  }


}