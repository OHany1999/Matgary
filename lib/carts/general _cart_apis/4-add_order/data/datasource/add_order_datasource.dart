import 'package:dio/dio.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/data/model/add_order_model.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';

abstract class BaseAddOrderRemoteDataSource {
  Future<AddOrderModel> getAddOrderData();
}

class AddOrderRemoteDataSource extends BaseAddOrderRemoteDataSource {
  @override
  Future<AddOrderModel> getAddOrderData() async {
    final AppPreferences _appPref = sl<AppPreferences>();
    Dio dio = Dio();
    final response = await dio.post(
      ApiConstance.addOrderPath,
      options: Options(headers: {
        'lang': 'ar',
        'Content-Type': 'application/json',
        'Authorization': '${_appPref.getToken()}',
      }),
      data: {"address_id": 35, "payment_method": 1, "use_points": false},
    );
    return AddOrderModel.fromJson(response.data);
  }
}
