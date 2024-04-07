import 'package:matgary/login/domain/entities/data_login_entity.dart';

class DataLoginModel extends DataLoginEntity {
  const DataLoginModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.points,
    required super.credit,
    required super.token,
  });

  factory DataLoginModel.fromJson(Map<String, dynamic> json) => DataLoginModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        points: json['points'],
        credit: json['credit'],
        token: json['token'],
      );
}
