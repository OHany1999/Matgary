import 'package:equatable/equatable.dart';
import 'package:matgary/product_details/domain/entities/add_favorite_entity.dart';



enum AddFavoriteRequestState{
  initial,
  loading,
  success,
  error,
}


class AddFavoriteState extends Equatable {
  final AddFavoriteEntity? addFavoriteEntity;
  final AddFavoriteRequestState addFavoriteRequestState;
  final String addErrorMessage;



  const AddFavoriteState({
    this.addFavoriteEntity,
     this.addFavoriteRequestState = AddFavoriteRequestState.initial,
    this.addErrorMessage ='',
  });


  AddFavoriteState copyWith({
    AddFavoriteEntity? addFavoriteEntity,
    AddFavoriteRequestState? addFavoriteRequestState,
    String? addErrorMessage,
  }) {
    return AddFavoriteState(
      addFavoriteEntity: addFavoriteEntity ?? this.addFavoriteEntity,
      addFavoriteRequestState: addFavoriteRequestState ?? this.addFavoriteRequestState,
      addErrorMessage: addErrorMessage ?? this.addErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [addFavoriteEntity,addFavoriteRequestState,addErrorMessage];
}




