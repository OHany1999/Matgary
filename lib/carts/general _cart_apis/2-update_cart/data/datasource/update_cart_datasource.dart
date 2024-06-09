import 'package:dio/dio.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/usecase/update_cart_usecase.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/update_and_remove_cart_model.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';

abstract class BaseUpdateCartRemoteDataSource {
  Future<UpdateAndDeleteCartModel> getUpdateCartData(UpdateCartParameters parameters);
}

class UpdateCartRemoteDataSource extends BaseUpdateCartRemoteDataSource {
  @override
  Future<UpdateAndDeleteCartModel> getUpdateCartData(
      UpdateCartParameters parameters) async {
    final AppPreferences _appPref = sl<AppPreferences>();
    Dio dio = Dio();
    final response = await dio.put(
      ApiConstance.update_cart_Path(id: parameters.id),
      options: Options(headers: {
        'lang': 'ar',

        'Authorization': '${_appPref.getToken()}',
      }),
      data: {"quantity": parameters.quantity},
    );
    return UpdateAndDeleteCartModel.fromJson(response.data);
  }
}
