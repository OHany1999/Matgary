import 'package:equatable/equatable.dart';

class FavoriteListEntity extends Equatable {
  final bool? status;
  final Null message;
  final DataList? data;

  const FavoriteListEntity(
      {required this.status, required this.message, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, data];

}


class DataList extends Equatable{

  List<Data>? data;
  int? total;


  DataList({this.data, this.total});

  @override
  // TODO: implement props
  List<Object?> get props => [data,total];



}


class Data extends Equatable{
  int? id;
  Product? product;

  Data({this.id, this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [id,product];

}

class Product extends Equatable{
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product(
      {this.id, this.price, this.oldPrice, this.discount, this.image, this.name, this.description});

  @override
  // TODO: implement props
  List<Object?> get props => [id,price,oldPrice,discount,image,name,description];

}
