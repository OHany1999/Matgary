import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/cart_page/domain/usecase/get_cart_usecase.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_event.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_state.dart';
import 'package:matgary/core/usecase/base_usecase.dart';

class GetCartBloc extends Bloc<GetCartEvent, GetCartState> {
  final GetCartUseCase getCartUseCase;

  GetCartBloc(this.getCartUseCase) : super(const GetCartState()) {
    on<GetCartEvent>(_getCart);
  }

  FutureOr<void> _getCart(GetCartEvent event, Emitter<GetCartState> emit) async {
    emit(state.copyWith(getCartRequestState: GetCartRequestState.loading));
    final result = await getCartUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(getCartErrorMessage:l.message ,getCartRequestState: GetCartRequestState.error)),
          (r) => emit(state.copyWith(getCartEntity: r,getCartRequestState: GetCartRequestState.success)),
    );
  }
}