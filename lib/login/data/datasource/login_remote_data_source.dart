import 'package:dio/dio.dart';
import 'package:matgary/core/error/exceptions.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/network/error_message_model.dart';
import 'package:matgary/login/data/model/login_model.dart';
import 'package:matgary/login/domain/usecase/get_login_usecase.dart';

abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> getLoginData(LoginParameters loginParameters);
}



class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  @override
  Future<LoginModel> getLoginData(LoginParameters loginParameters) async {
    Dio dio = Dio();
    final response = await dio.post(
      ApiConstance.loginPath,
      data: {"email": loginParameters.email, "password": loginParameters.password},
      queryParameters: {'Content-Type': 'application/json'},
    );
    if(response.statusCode == 200){
      return LoginModel.fromJson(response.data);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
