import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:matgary/product_details/domain/usecase/add_favorite_usecase.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_event.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_state.dart';

class AddFavoriteBloc extends Bloc<AddFavoriteEvent, AddFavoriteState> {
  final AddFavoriteUseCase addFavoriteUseCase;

  AddFavoriteBloc(this.addFavoriteUseCase) : super(const AddFavoriteState()) {
    on<GetAddFavoriteEvent>(_getAddFavorite);
  }

  FutureOr<void> _getAddFavorite(
      GetAddFavoriteEvent event, Emitter<AddFavoriteState> emit) async {
    emit(state.copyWith(
        addFavoriteRequestState: AddFavoriteRequestState.loading));

    final result =
        await addFavoriteUseCase(AddFavoriteParameters(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(addErrorMessage:l.message ,addFavoriteRequestState: AddFavoriteRequestState.error)),
      (r) => emit(state.copyWith(addFavoriteEntity: r,addFavoriteRequestState: AddFavoriteRequestState.success)),
    );
  }
}
