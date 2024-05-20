import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/favorite/domain/usecase/favorite_list_usecase.dart';
import 'package:matgary/favorite/presentation/controller/delete_favorite_bloc/delete_favorite_event.dart';
import 'package:matgary/favorite/presentation/controller/delete_favorite_bloc/delete_favorite_state.dart';

class DeleteFavoriteBloc
    extends Bloc<DeleteFavoriteEvent, DeleteFavoriteState> {
  final DeleteFavoriteUseCase deleteFavoriteUseCase;

  DeleteFavoriteBloc(this.deleteFavoriteUseCase)
      : super(const DeleteFavoriteState()) {
    on<GetDeleteFavoriteEvent>(_getDeleteFavorite);
  }

  FutureOr<void> _getDeleteFavorite(
      GetDeleteFavoriteEvent event, Emitter<DeleteFavoriteState> emit) async {
    emit(state.copyWith(
        deleteFavoriteRequestState: DeleteFavoriteRequestState.loading));
    final result = await deleteFavoriteUseCase(event.id);
    result.fold(
      (l) => emit(state.copyWith(deleteFavoriteErrorMessage: l.message,deleteFavoriteRequestState: DeleteFavoriteRequestState.error)),
      (r) => emit(state.copyWith(deleteFavoriteEntity: r,deleteFavoriteRequestState: DeleteFavoriteRequestState.success)),
    );
  }
}
