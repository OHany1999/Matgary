import 'package:equatable/equatable.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/domain/entities/add_order_entity.dart';

enum AddOrderRequestState{
  initial,
  loading,
  success,
  error,
}


class AddOrderState extends Equatable {
  final AddOrderEntity? addOrderEntity;
  final AddOrderRequestState addOrderRequestState;
  final String addOrderErrorMessage;



  const AddOrderState({
    this.addOrderEntity,
    this.addOrderRequestState = AddOrderRequestState.initial,
    this.addOrderErrorMessage ='',
  });


  AddOrderState copyWith({
    AddOrderEntity? addOrderEntity,
    AddOrderRequestState? addOrderRequestState,
    String? addOrderErrorMessage,
  }) {
    return AddOrderState(
      addOrderEntity: addOrderEntity ?? this.addOrderEntity,
      addOrderRequestState: addOrderRequestState ?? this.addOrderRequestState,
      addOrderErrorMessage: addOrderErrorMessage ?? this.addOrderErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [addOrderEntity,addOrderRequestState,addOrderErrorMessage];
}