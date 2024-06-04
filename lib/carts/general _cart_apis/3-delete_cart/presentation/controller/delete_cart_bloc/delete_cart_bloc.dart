import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/usecase/delete_cart_usecase.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/presentation/controller/delete_cart_bloc/delete_cart_event.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/presentation/controller/delete_cart_bloc/delete_cart_state.dart';

class DeleteCartBloc extends Bloc<DeleteCartEvent, DeleteCartState> {
  final DeleteCartUseCase deleteCartUseCase;

  DeleteCartBloc(this.deleteCartUseCase) : super(const DeleteCartState()) {
    on<GetDeleteCartEvent>(_getDeleteCart);
  }

  FutureOr<void> _getDeleteCart(GetDeleteCartEvent event, Emitter<DeleteCartState> emit) async {
    emit(state.copyWith(deleteCartRequestState: DeleteCartRequestState.loading));
    final result = await deleteCartUseCase(DeleteCartParameters(id: event.id));
    result.fold(
          (l) => emit(state.copyWith(deleteCartErrorMessage:l.message ,deleteCartRequestState: DeleteCartRequestState.error)),
          (r) => emit(state.copyWith(updateAndDeleteCartEntity: r,deleteCartRequestState: DeleteCartRequestState.success)),
    );
  }
}