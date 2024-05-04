import 'package:matgary/login/data/model/data_model.dart';
import 'package:matgary/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'],
        message: json['message'],
        data:json['data'] !=null ? DataLoginModel.fromJson(json['data']): null,
      );
}
