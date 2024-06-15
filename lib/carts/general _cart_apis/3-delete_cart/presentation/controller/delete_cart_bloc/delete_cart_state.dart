import 'package:equatable/equatable.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/upate_and_remove_cart_entity.dart';

enum DeleteCartRequestState{
  initial,
  loading,
  success,
  error,
}


class DeleteCartState extends Equatable {
  final UpdateAndDeleteCartEntity? updateAndDeleteCartEntity;
  final DeleteCartRequestState deleteCartRequestState;
  final String deleteCartErrorMessage;



  const DeleteCartState({
    this.updateAndDeleteCartEntity,
    this.deleteCartRequestState = DeleteCartRequestState.initial,
    this.deleteCartErrorMessage ='',
  });


  DeleteCartState copyWith({
    UpdateAndDeleteCartEntity? updateAndDeleteCartEntity,
    DeleteCartRequestState? deleteCartRequestState,
    String? deleteCartErrorMessage,
  }) {
    return DeleteCartState(
      updateAndDeleteCartEntity: updateAndDeleteCartEntity ?? this.updateAndDeleteCartEntity,
      deleteCartRequestState: deleteCartRequestState ?? this.deleteCartRequestState,
      deleteCartErrorMessage: deleteCartErrorMessage ?? this.deleteCartErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [updateAndDeleteCartEntity,deleteCartRequestState,deleteCartErrorMessage];
}