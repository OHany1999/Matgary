import 'package:equatable/equatable.dart';

abstract class DeleteFavoriteEvent extends Equatable {
  const DeleteFavoriteEvent();

  List<Object?> get props => [];
}

class GetDeleteFavoriteEvent extends DeleteFavoriteEvent {
  final int id;

  GetDeleteFavoriteEvent({required this.id});


  @override
  List<Object?> get props => [];
}



