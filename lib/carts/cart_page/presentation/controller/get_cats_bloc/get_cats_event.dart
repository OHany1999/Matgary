import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable{}

class GetCartEvent extends CartEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}