
import 'package:equatable/equatable.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';


enum UpdateCartRequestState{
  initial,
  loading,
  success,
  error,
}


class UpdateCartState extends Equatable {
  final SuccessEntity? updateCartEntity;
  final UpdateCartRequestState updateCartRequestState;
  final String updateCartErrorMessage;



  const UpdateCartState({
    this.updateCartEntity,
    this.updateCartRequestState = UpdateCartRequestState.initial,
    this.updateCartErrorMessage ='',
  });


  UpdateCartState copyWith({
    SuccessEntity? updateCartEntity,
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