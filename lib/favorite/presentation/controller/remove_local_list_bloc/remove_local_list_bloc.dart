import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/favorite/presentation/controller/remove_local_list_bloc/remove_local_list_state.dart';

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
