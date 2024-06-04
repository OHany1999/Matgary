import 'package:equatable/equatable.dart';

abstract class DeleteCartEvent extends Equatable{}

class GetDeleteCartEvent extends DeleteCartEvent{
  final int id;

  GetDeleteCartEvent({required this.id});


  @override
  // TODO: implement props
  List<Object?> get props => [id];
}