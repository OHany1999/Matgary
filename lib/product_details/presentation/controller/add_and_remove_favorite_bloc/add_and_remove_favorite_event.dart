import 'package:equatable/equatable.dart';

abstract class AddFavoriteEvent extends Equatable{}

class GetAddFavoriteEvent extends AddFavoriteEvent{
  final int id;

  GetAddFavoriteEvent({required this.id});


  @override
  // TODO: implement props
  List<Object?> get props => [id];
}