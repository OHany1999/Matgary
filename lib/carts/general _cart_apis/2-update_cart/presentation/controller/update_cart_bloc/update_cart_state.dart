
import 'package:equatable/equatable.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/entities/update_cart_entity.dart';

enum UpdateCartRequestState{
  initial,
  loading,
  success,
  error,
}


class UpdateCartState extends Equatable {
  final UpdateCartEntity? updateCartEntity;
  final UpdateCartRequestState updateCartRequestState;
  final String updateCartErrorMessage;



  const UpdateCartState({
    this.updateCartEntity,
    this.updateCartRequestState = UpdateCartRequestState.initial,
    this.updateCartErrorMessage ='',
  });


  UpdateCartState copyWith({
    UpdateCartEntity? updateCartEntity,
    UpdateCartRequestState? updateCartRequestState,
    String? updateCartErrorMessage,
  }) {
    return UpdateCartState(
      updateCartEntity: updateCartEntity ?? this.updateCartEntity,
      updateCartRequestState: updateCartRequestState ?? this.updateCartRequestState,
      updateCartErrorMessage: updateCartErrorMessage ?? this.updateCartErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [updateCartEntity,updateCartRequestState,updateCartErrorMessage];
}