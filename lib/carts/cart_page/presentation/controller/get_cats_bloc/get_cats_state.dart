import 'package:equatable/equatable.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_state.dart';

enum GetCartRequestState{
  initial,
  loading,
  success,
  error,
}


class GetCartState extends Equatable {
  final GetCartEntity? getCartEntity;
  final GetCartRequestState getCartRequestState;
  final String getCartErrorMessage;



  const GetCartState({
    this.getCartEntity,
    this.getCartRequestState = GetCartRequestState.initial,
    this.getCartErrorMessage ='',
  });


  GetCartState copyWith({
    GetCartEntity? getCartEntity,
    GetCartRequestState? getCartRequestState,
    String? getCartErrorMessage,
  }) {
    return GetCartState(
      getCartEntity: getCartEntity ?? this.getCartEntity,
      getCartRequestState: getCartRequestState ?? this.getCartRequestState,
      getCartErrorMessage: getCartErrorMessage ?? this.getCartErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [getCartEntity,getCartRequestState,getCartErrorMessage];
}