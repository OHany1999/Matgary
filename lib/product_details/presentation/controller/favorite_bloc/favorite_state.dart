import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  final bool favorite ;
  const FavoriteState({required this.favorite});


  @override
  // TODO: implement props
  List<Object?> get props => [favorite];
}