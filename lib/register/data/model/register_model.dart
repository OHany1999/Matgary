import 'package:matgary/register/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        message: json["message"],
        data: json['data'] != null
            ? RegisterDataModel.fromJson(json['data'])
            : null,
      );
}

class RegisterDataModel extends RegisterDataEntity {
  const RegisterDataModel(
      {required super.name,
      required super.phone,
      required super.email,
      required super.id,
      required super.image,
      required super.token});


  factory RegisterDataModel.fromJson(Map<String, dynamic> json) => RegisterDataModel(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );
}


