
import 'package:equatable/equatable.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/upate_and_remove_cart_entity.dart';


enum UpdateCartRequestState{
  initial,
  loading,
  success,
  error,
}


class UpdateCartState extends Equatable {
  final UpdateAndDeleteCartEntity? updateCartEntity;
  final UpdateCartRequestState updateCartRequestState;
  final String updateCartErrorMessage;



  const UpdateCartState({
    this.updateCartEntity,
    this.updateCartRequestState = UpdateCartRequestState.initial,
    this.updateCartErrorMessage ='',
  });


  UpdateCartState copyWith({
    UpdateAndDeleteCartEntity? updateCartEntity,
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