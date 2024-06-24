import 'package:dio/dio.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_model.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/register/domain/usecase/register_usecase.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<SuccessModel> getRegisterData(RegisterParameters parameters);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<SuccessModel> getRegisterData(RegisterParameters parameters) async {
    Dio dio = Dio();
    final response = await dio.post(
      ApiConstance.registerPath,
      options: Options(headers: {
        'lang': 'ar',
        'Content-Type': 'Content-Type',
      }),
      data: {
        "name": parameters.name,
        "phone": parameters.phone,
        "email": parameters.email,
        "password": parameters.password
      },
    );
    return SuccessModel.fromJson(response.data);
  }
}
