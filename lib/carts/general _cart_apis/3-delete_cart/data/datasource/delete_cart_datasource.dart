import 'package:dio/dio.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/usecase/delete_cart_usecase.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/update_and_remove_cart_model.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';

abstract class BaseDeleteCartRemoteDataSource {
  Future<UpdateAndDeleteCartModel> getDeleteCartData(DeleteCartParameters parameters);
}


class DeleteCartRemoteDataSource extends BaseDeleteCartRemoteDataSource {
  @override
  Future<UpdateAndDeleteCartModel> getDeleteCartData(DeleteCartParameters parameters) async {
  final AppPreferences _appPref = sl<AppPreferences>();
  Dio dio = Dio();
  final response = await dio.delete(
  ApiConstance.delete_cart_Path(id: parameters.id),
  options: Options(headers: {
  'lang':'ar',
  'Content-Type':'Content-Type',
  'Authorization':'${_appPref.getToken()}',
  }),

  );
  return UpdateAndDeleteCartModel.fromJson(response.data);

  }
}
