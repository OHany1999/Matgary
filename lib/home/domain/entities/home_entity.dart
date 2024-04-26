import 'package:equatable/equatable.dart';

  class HomeEntity extends Equatable{
  final bool? status;
  final Null message;
  final DataEntity? data;

  HomeEntity({required this.status,required this.message,required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];

}




class DataEntity extends Equatable{
    final  List<BannersEntity>? banners;
    final List<ProductsEntity>? products;
    final String? ad;

    DataEntity({required this.banners, required this.products, required this.ad});


  @override
  // TODO: implement props
  List<Object?> get props => [banners, products,ad];

}


class BannersEntity extends Equatable{
  final int? id;
  final String? image;
  final Null category;
  final Null product;

  BannersEntity({required this.id, required this.image, required this.category, required this.product});


  @override
  // TODO: implement props
  List<Object?> get props => [id,image,category,product];

}

class ProductsEntity extends Equatable{
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

  ProductsEntity({required this.id, required this.price, required this.oldPrice, required this.discount, required this.image, required this.name, required this.description, required this.images, required this.inFavorites, required this.inCart});


  @override
  // TODO: implement props
  List<Object?> get props => [id,price,oldPrice,discount,image,name,description,images,inFavorites,inCart];
}