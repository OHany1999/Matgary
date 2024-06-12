import 'package:equatable/equatable.dart';

class AddOrderEntity extends Equatable{
  final bool? status;
  final String? message;
  final AddOrderData? addOrderData;

  AddOrderEntity({
    required this.status,
    required this.message,
    required this.addOrderData,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status,message,addOrderData];

}

class AddOrderData extends Equatable{
  final String? paymentMethod;
  final int? id;

  AddOrderData({
    required this.paymentMethod,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [paymentMethod,id];

}
