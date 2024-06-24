import 'package:dio/dio.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/usecase/delete_cart_usecase.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_model.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';

abstract class BaseDeleteCartRemoteDataSource {
  Future<SuccessModel> getDeleteCartData(DeleteCartParameters parameters);
}


class DeleteCartRemoteDataSource extends BaseDeleteCartRemoteDataSource {
  @override
  Future<SuccessModel> getDeleteCartData(DeleteCartParameters parameters) async {
  final AppPreferences _appPref = sl<AppPreferences>();
  Dio dio = Dio();
  final response = await dio.delete(
  ApiConstance.delete_cart_Path(id: parameters.id),
  options: Options(headers: {
  'lang':'ar',
  'Authorization':'${_appPref.getToken()}',
  }),

  );
  return SuccessModel.fromJson(response.data);

  }
}
