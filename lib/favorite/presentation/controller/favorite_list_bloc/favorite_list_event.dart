import 'package:equatable/equatable.dart';

abstract class FavoriteListEvent extends Equatable {
  const FavoriteListEvent();

  List<Object?> get props => [];
}

class GetFavoriteListEvent extends FavoriteListEvent {
  @override
  List<Object?> get props => [];
}



