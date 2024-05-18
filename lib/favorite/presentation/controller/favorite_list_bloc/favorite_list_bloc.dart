import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/favorite/domain/usecase/favorite_list_usecase.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_event.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final GetFavoriteListUseCase getFavoriteListUseCase;

  FavoriteListBloc(this.getFavoriteListUseCase)
      : super(const FavoriteListState()) {
    on<GetFavoriteListEvent>(_getFavoriteList);
  }

  FutureOr<void> _getFavoriteList(
      GetFavoriteListEvent event, Emitter<FavoriteListState> emit) async {
    emit(state.copyWith(
        favoriteListRequestState: FavoriteListRequestState.loading));
    final result = await getFavoriteListUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          favoriteListErrorMessage: l.message,
          favoriteListRequestState: FavoriteListRequestState.error)),
      (r) => emit(state.copyWith(
          favoriteListEntity: r,
          favoriteListRequestState: FavoriteListRequestState.success)),
    );
  }
}

//////////////////////////////////////////////////////////
class RemoveLocalListBloc extends Bloc<String, RemoveLocalListState> {
  RemoveLocalListBloc() : super(const RemoveLocalListState()) {
    on<String>(_removeLocalList);
  }

  FutureOr<void> _removeLocalList(
      String event, Emitter<RemoveLocalListState> emit) {
    if (event == 'localRemove') {
      emit(RemoveLocalListState(removeLocalState: !state.removeLocalState));
    }
  }
}
