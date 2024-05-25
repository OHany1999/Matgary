import 'package:equatable/equatable.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/domain/entities/add_or_remove_cart_entity.dart';

enum AddOrRemoveCartRequestState{
  initial,
  loading,
  success,
  error,
}


class AddOrRemoveCartState extends Equatable {
  final AddOrRemoveCartEntity? addOrRemoveCartEntity;
  final AddOrRemoveCartRequestState addOrRemoveCartRequestState;
  final String addOrRemoveCartErrorMessage;



  const AddOrRemoveCartState({
    this.addOrRemoveCartEntity,
    this.addOrRemoveCartRequestState = AddOrRemoveCartRequestState.initial,
    this.addOrRemoveCartErrorMessage ='',
  });


  AddOrRemoveCartState copyWith({
    AddOrRemoveCartEntity? addOrRemoveCartEntity,
    AddOrRemoveCartRequestState? addOrRemoveCartRequestState,
    String? addOrRemoveCartErrorMessage,
  }) {
    return AddOrRemoveCartState(
      addOrRemoveCartEntity: addOrRemoveCartEntity ?? this.addOrRemoveCartEntity,
      addOrRemoveCartRequestState: addOrRemoveCartRequestState ?? this.addOrRemoveCartRequestState,
      addOrRemoveCartErrorMessage: addOrRemoveCartErrorMessage ?? this.addOrRemoveCartErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [addOrRemoveCartEntity,addOrRemoveCartRequestState,addOrRemoveCartErrorMessage];
}
