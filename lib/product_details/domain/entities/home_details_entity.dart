import 'package:equatable/equatable.dart';

  class ProductDetailsEntity extends Equatable{
  final bool? status;
  final Null message;
  final ProductDataEntity? data;

  const ProductDetailsEntity({required this.status,required this.message,required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];

}




class ProductDataEntity extends Equatable{
  final dynamic id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;
  final String? name;
  final String? description;
  final List<dynamic>? images;
  final bool? inFavorites;
   bool inCart;

   ProductDataEntity({required this.id, required this.price, required this.oldPrice, required this.discount, required this.image, required this.name, required this.description, required this.images, required this.inFavorites, required this.inCart});


  @override
  // TODO: implement props
  List<Object?> get props => [id,price,oldPrice,discount,image,name,description,images,inFavorites,inCart];
}