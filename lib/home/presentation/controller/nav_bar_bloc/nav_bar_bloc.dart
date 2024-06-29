import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_event.dart';
import 'package:matgary/home/presentation/controller/nav_bar_bloc/nav_bar_state.dart';

class BottomNavigationBloc extends Bloc<BaseTabChangeEvent, BottomNavigationState> {
  BottomNavigationBloc():super(const BottomNavigationState(selectedIndex: 1)){
    on<BaseTabChangeEvent>(_changeIndex);
  }


  FutureOr<void> _changeIndex(BaseTabChangeEvent event, Emitter<BottomNavigationState> emit) {
    if(event is TabChangeEvent){
      print(event.tabIndex);
      emit(BottomNavigationState(selectedIndex: event.tabIndex));
    }
  }
}