import 'package:matgary/carts/general%20_cart_apis/4-add_order/domain/entities/add_order_entity.dart';

class AddOrderModel extends AddOrderEntity {
  AddOrderModel({
    required super.status,
    required super.message,
    required super.addOrderData,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
        status: json['status'],
        message: json['message'],
        addOrderData: json['data'] != null ? AddOrderDataModel.fromJson(json['data'])
            : null,
      );
}

class AddOrderDataModel extends AddOrderDataEntity {
  AddOrderDataModel({
    required super.paymentMethod,
    required super.id,
  });

  factory AddOrderDataModel.fromJson(Map<String, dynamic> json) =>
      AddOrderDataModel(
        paymentMethod: json['payment_method'],
        id: json['id'],
      );
}
