

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/home/presentation/controller/slider_indicator_bloc/slider_indicator_event.dart';
import 'package:matgary/home/presentation/controller/slider_indicator_bloc/slider_indicator_state.dart';

class SliderIndicatorBloc extends Bloc<BaseSliderIndicatorEvent, SliderIndicatorState> {
  SliderIndicatorBloc():super(const SliderIndicatorState(selectedIndex: 0)){
    on<BaseSliderIndicatorEvent>(_changeIndex);
  }


  FutureOr<void> _changeIndex(BaseSliderIndicatorEvent event, Emitter<SliderIndicatorState> emit) {
    if(event is SliderIndicatorEvent){
      print(event.tabIndex);
      emit(SliderIndicatorState(selectedIndex: event.tabIndex));
    }
  }
}