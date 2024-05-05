import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/product_details/presentation/controller/favorite_bloc/favorite_event.dart';
import 'package:matgary/product_details/presentation/controller/favorite_bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<BaseFavoriteEvent, FavoriteState> {
  FavoriteBloc():super(const FavoriteState(favorite: false)){
    on<BaseFavoriteEvent>(_changeFavorite);
  }




  FutureOr<void> _changeFavorite(BaseFavoriteEvent event, Emitter<FavoriteState> emit) {
    if(event is FavoriteEvent){
      emit(FavoriteState(favorite: event.isFav));
    }

  }

}