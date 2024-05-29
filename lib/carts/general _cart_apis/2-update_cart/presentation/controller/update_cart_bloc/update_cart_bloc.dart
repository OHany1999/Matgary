import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/usecase/update_cart_usecase.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/presentation/controller/update_cart_bloc/update_cart_event.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/presentation/controller/update_cart_bloc/update_cart_state.dart';

class UpdateCartBloc extends Bloc<UpdateCartEvent, UpdateCartState> {
  final UpdateCartUseCase updateCartUseCase;

  UpdateCartBloc(this.updateCartUseCase) : super(const UpdateCartState()) {
    on<GetUpdateCartEvent>(_getUpdateCart);
  }

  FutureOr<void> _getUpdateCart(GetUpdateCartEvent event, Emitter<UpdateCartState> emit) async {
    emit(state.copyWith(updateCartRequestState: UpdateCartRequestState.loading));
    final result = await updateCartUseCase(UpdateCartParameters(quantity: event.quantity, id: event.id));
    result.fold(
          (l) => emit(state.copyWith(updateCartErrorMessage:l.message ,updateCartRequestState: UpdateCartRequestState.error)),
          (r) => emit(state.copyWith(updateCartEntity: r,updateCartRequestState: UpdateCartRequestState.success)),
    );
  }
}