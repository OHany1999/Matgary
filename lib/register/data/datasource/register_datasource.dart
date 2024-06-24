import 'package:dio/dio.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/register/data/model/register_model.dart';
import 'package:matgary/register/domain/usecase/register_usecase.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<RegisterModel> getRegisterData(RegisterParameters parameters);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<RegisterModel> getRegisterData(RegisterParameters parameters) async {
    Dio dio = Dio();
    final response = await dio.post(
      ApiConstance.registerPath,
      options: Options(headers: {
        'lang': 'ar',
        'Content-Type': 'application/json',
      }),
      data: {
        "name": parameters.name,
        "phone": parameters.phone,
        "email": parameters.email,
        "password": parameters.password
      },
    );
    return RegisterModel.fromJson(response.data);
  }
}
