import 'package:equatable/equatable.dart';

  class HomeDetailsEntity extends Equatable{
  final bool? status;
  final Null message;
  final ProductDetailsEntity? data;

  HomeDetailsEntity({required this.status,required this.message,required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];

}




class ProductDetailsEntity extends Equatable{
  final int? id;
  final double? price;
  final double? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<dynamic>? images;
  final bool? inFavorites;
  final bool? inCart;

  ProductDetailsEntity({required this.id, required this.price, required this.oldPrice, required this.discount, required this.image, required this.name, required this.description, required this.images, required this.inFavorites, required this.inCart});


  @override
  // TODO: implement props
  List<Object?> get props => [id,price,oldPrice,discount,image,name,description,images,inFavorites,inCart];
}