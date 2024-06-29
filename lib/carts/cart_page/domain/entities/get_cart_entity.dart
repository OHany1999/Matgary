import 'package:equatable/equatable.dart';

class GetCartEntity extends Equatable{
  final bool? status;
  dynamic message;
  final GetCartDataEntity? data;

  GetCartEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];

}

class GetCartDataEntity extends Equatable{
  final List<CartItemEntity>? cartItems;
  final dynamic subTotal;
  final dynamic total;

  GetCartDataEntity({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [cartItems,subTotal,total];

}

class CartItemEntity extends Equatable{
  final int? id;
  final int? quantity;
  final ProductEntity? product;

  CartItemEntity({
    required this.id,
    required this.quantity,
    required this.product,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[id,quantity,product];

}

class ProductEntity extends Equatable{
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  final bool? inFavorites;
  final bool? inCart;

  ProductEntity({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,price,oldPrice,discount,image,name,description,images,inFavorites,inCart];

}
