import 'package:equatable/equatable.dart';

class FavoriteListEntity extends Equatable {
  final bool? status;
  final Null message;
  final DataListEntity? data;

  const FavoriteListEntity(
      {required this.status, required this.message, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, data];

}


class DataListEntity extends Equatable{

  List<DataEntity>? data;
  int? total;


  DataListEntity({this.data, this.total});

  @override
  // TODO: implement props
  List<Object?> get props => [data,total];



}


class DataEntity extends Equatable{
  int? id;
  ProductEntity? product;

  DataEntity({this.id, this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [id,product];

}

class ProductEntity extends Equatable{
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  ProductEntity(
      {this.id, this.price, this.oldPrice, this.discount, this.image, this.name, this.description});

  @override
  // TODO: implement props
  List<Object?> get props => [id,price,oldPrice,discount,image,name,description];

}
