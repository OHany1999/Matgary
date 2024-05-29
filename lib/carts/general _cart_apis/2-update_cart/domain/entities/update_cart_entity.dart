import 'package:equatable/equatable.dart';

class UpdateCartEntity extends Equatable{
  final bool? status;
  final String? message;
  final DataEntity? data;

  UpdateCartEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];

}

class DataEntity extends Equatable{
  final CartEntity? cart;
  final int? subTotal;
  final int? total;

  DataEntity({
    required this.cart,
    required this.subTotal,
    required this.total,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cart,subTotal,total];

}

class CartEntity extends Equatable{
  final int? id;
  final int? quantity;
  final ProductEntity? product;

  CartEntity({
    required this.id,
    required this.quantity,
    required this.product,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,quantity,product];

}

class ProductEntity extends Equatable{
  final int? id;
  final int? price;
  final int? oldPrice;
  final int? discount;
  final String? image;

  ProductEntity({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,price,oldPrice,discount,image];

}
