import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/domain/usecase/add_or_remove_cart_usecase.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/presentation/controller/add_or_remove_cart_bloc/add_or_remove_cart_event.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/presentation/controller/add_or_remove_cart_bloc/add_or_remove_cart_state.dart';

class AddOrRemoveCartBloc extends Bloc<AddOrRemoveCartEvent, AddOrRemoveCartState> {
  final AddOrRemoveCartUseCase addOrRemoveCartUseCase;

  AddOrRemoveCartBloc(this.addOrRemoveCartUseCase) : super(const AddOrRemoveCartState()) {
    on<GetAddOrRemoveCartEvent>(_getAddOrRemoveCart);
  }

  FutureOr<void> _getAddOrRemoveCart(GetAddOrRemoveCartEvent event, Emitter<AddOrRemoveCartState> emit) async {
    emit(state.copyWith(addOrRemoveCartRequestState: AddOrRemoveCartRequestState.loading));
    final result = await addOrRemoveCartUseCase(AddOrRemoveCartParameters(productId: event.id));

    result.fold(
          (l) => emit(state.copyWith(addOrRemoveCartErrorMessage:l.message ,addOrRemoveCartRequestState: AddOrRemoveCartRequestState.error)),
          (r) => emit(state.copyWith(addOrRemoveCartEntity: r,addOrRemoveCartRequestState: AddOrRemoveCartRequestState.success)),
    );
  }
}