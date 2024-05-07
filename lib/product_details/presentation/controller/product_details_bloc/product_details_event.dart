import 'package:equatable/equatable.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  List<Object?> get props => [];
}

class GetProductDetailsEvent extends ProductDetailsEvent {
  final int id;


  const GetProductDetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}



