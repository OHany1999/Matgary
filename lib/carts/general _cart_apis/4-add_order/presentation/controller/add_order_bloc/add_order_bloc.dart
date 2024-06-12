import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/domain/usecase/add_order_usecase.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/presentation/controller/add_order_bloc/add_order_event.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/presentation/controller/add_order_bloc/add_order_state.dart';
import 'package:matgary/core/usecase/base_usecase.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  final AddOrderUseCase addOrderUseCase;

  AddOrderBloc(this.addOrderUseCase) : super(const AddOrderState()) {
    on<GetAddOrderEvent>(_getAddOrder);
  }

  FutureOr<void> _getAddOrder(GetAddOrderEvent event, Emitter<AddOrderState> emit) async {
    emit(state.copyWith(addOrderRequestState: AddOrderRequestState.loading));
    final result = await addOrderUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(addOrderErrorMessage:l.message ,addOrderRequestState: AddOrderRequestState.error)),
          (r) => emit(state.copyWith(addOrderEntity: r,addOrderRequestState: AddOrderRequestState.success)),
    );
  }
}