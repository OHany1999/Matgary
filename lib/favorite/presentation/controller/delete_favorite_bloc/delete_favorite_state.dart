import 'package:equatable/equatable.dart';
import 'package:matgary/favorite/domain/entities/delete_favorite_entity.dart';

enum DeleteFavoriteRequestState {
  initial,
  loading,
  success,
  error,
}

class DeleteFavoriteState extends Equatable {
  final DeleteFavoriteEntity? deleteFavoriteEntity;
  final DeleteFavoriteRequestState deleteFavoriteRequestState;
  final String deleteFavoriteErrorMessage;

  const DeleteFavoriteState({
     this.deleteFavoriteEntity,
     this.deleteFavoriteRequestState = DeleteFavoriteRequestState.initial,
     this.deleteFavoriteErrorMessage ='',
  });


  DeleteFavoriteState copyWith({
    DeleteFavoriteEntity? deleteFavoriteEntity,
    DeleteFavoriteRequestState? deleteFavoriteRequestState,
    String? deleteFavoriteErrorMessage,
}){
    return DeleteFavoriteState(
      deleteFavoriteEntity: deleteFavoriteEntity ?? this.deleteFavoriteEntity,
      deleteFavoriteRequestState: deleteFavoriteRequestState ?? this.deleteFavoriteRequestState,
      deleteFavoriteErrorMessage: deleteFavoriteErrorMessage ?? this.deleteFavoriteErrorMessage,
    );
}


  @override
  // TODO: implement props
  List<Object?> get props => [deleteFavoriteEntity,deleteFavoriteRequestState,deleteFavoriteErrorMessage];

}
