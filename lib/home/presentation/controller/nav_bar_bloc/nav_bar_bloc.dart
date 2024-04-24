import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_event.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_state.dart';

class BottomNavigationBloc extends Bloc<LandingPageEvent, BottomNavigationState> {
  BottomNavigationBloc():super(const BottomNavigationState(selectedIndex: 0)){
    on<LandingPageEvent>(_changeIndex);
  }


  // FutureOr<void> _changeIndex(int event, Emitter<BottomNavigationState> emit) {
  //   int num = 0;
  //     emit(BottomNavigationState(selectedIndex: num));
  // }

  FutureOr<void> _changeIndex(LandingPageEvent event, Emitter<BottomNavigationState> emit) {
    if(event is TabChangeEvent){
      print(event.tabIndex);
      emit(BottomNavigationState(selectedIndex: event.tabIndex));
    }
  }
}