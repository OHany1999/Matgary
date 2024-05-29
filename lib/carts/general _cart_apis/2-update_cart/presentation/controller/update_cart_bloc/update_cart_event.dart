
import 'package:equatable/equatable.dart';

abstract class UpdateCartEvent extends Equatable{}

class GetUpdateCartEvent extends UpdateCartEvent{
  final int quantity;
  final int id;

  GetUpdateCartEvent({required this.quantity,required this.id});


  @override
  // TODO: implement props
  List<Object?> get props => [id,quantity];
}
