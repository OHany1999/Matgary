
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/domain/entities/add_or_remove_cart_entity.dart';

class AddOrRemoveCartModel extends AddOrRemoveCartEntity {
  AddOrRemoveCartModel({
    required super.status,
    required super.message,
  });

  factory AddOrRemoveCartModel.fromJson(Map<String, dynamic> json) => AddOrRemoveCartModel(
    status: json['status'],
    message: json['message'],
  );
}