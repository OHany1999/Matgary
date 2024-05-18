import 'package:equatable/equatable.dart';
import 'package:matgary/favorite/domain/entities/favorite_list_entity.dart';
import 'package:matgary/product_details/domain/entities/add_favorite_entity.dart';



enum FavoriteListRequestState{
  initial,
  loading,
  success,
  error,
}




class FavoriteListState extends Equatable {
  final FavoriteListEntity? favoriteListEntity;
  final FavoriteListRequestState favoriteListRequestState;
  final String favoriteListErrorMessage;



  const FavoriteListState({
    this.favoriteListEntity,
    this.favoriteListRequestState = FavoriteListRequestState.initial,
    this.favoriteListErrorMessage ='',
  });


  FavoriteListState copyWith({
    FavoriteListEntity? favoriteListEntity,
    FavoriteListRequestState? favoriteListRequestState,
    String? favoriteListErrorMessage,
  }) {
    return FavoriteListState(
      favoriteListEntity: favoriteListEntity ?? this.favoriteListEntity,
      favoriteListRequestState: favoriteListRequestState ?? this.favoriteListRequestState,
      favoriteListErrorMessage: favoriteListErrorMessage ?? this.favoriteListErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favoriteListEntity,favoriteListRequestState,favoriteListErrorMessage];
}




