import 'package:dio/dio.dart';
import 'package:matgary/carts/cart_page/data/model/get_cart_model.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';

abstract class BaseGetCartRemoteDataSource {
  Future<GetCartModel> getCartData();
}

class GetCartRemoteDataSource extends BaseGetCartRemoteDataSource {
  @override
  Future<GetCartModel> getCartData() async {
    final AppPreferences _appPref = sl<AppPreferences>();
    Dio dio = Dio();
    final response = await dio.get(
      ApiConstance.getCartsPath,
      options: Options(headers: {
        'lang': 'ar',
        'Content-Type': 'Content-Type',
        'Authorization': '${_appPref.getToken()}',
      }),
    );
    return GetCartModel.fromJson(response.data);
  }
}
