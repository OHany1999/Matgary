import 'package:equatable/equatable.dart';

abstract class AddOrRemoveCartEvent extends Equatable{}

class GetAddOrRemoveCartEvent extends AddOrRemoveCartEvent{
  final int id;

  GetAddOrRemoveCartEvent({required this.id});


  @override
  // TODO: implement props
  List<Object?> get props => [id];
}