import 'package:equatable/equatable.dart';

  class HomeEntity extends Equatable{
  final bool? status;
  final Null message;
  final Data? data;

  HomeEntity({required this.status,required this.message,required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];

}




class Data extends Equatable{
    final  List<Banners>? banners;
    final List<Products>? products;
    final String? ad;

  Data({required this.banners, required this.products, required this.ad});


  @override
  // TODO: implement props
  List<Object?> get props => [banners, products,ad];

}


class Banners extends Equatable{
  final int? id;
  final String? image;
  final Null category;
  final Null product;

  Banners({required this.id, required this.image, required this.category, required this.product});


  @override
  // TODO: implement props
  List<Object?> get props => [id,image,category,product];

}

class Products extends Equatable{
  final int? id;
  final double? price;
  final double? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;
  final bool? inFavorites;
  final bool? inCart;

  Products({required this.id, required this.price, required this.oldPrice, required this.discount, required this.image, required this.name, required this.description, required this.images, required this.inFavorites, required this.inCart});


  @override
  // TODO: implement props
  List<Object?> get props => [id,price,oldPrice,discount,image,name,description,images,inFavorites,inCart];
}