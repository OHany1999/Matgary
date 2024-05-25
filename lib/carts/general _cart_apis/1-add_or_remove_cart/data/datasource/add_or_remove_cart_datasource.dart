import 'package:dio/dio.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/data/model/add_or_remove_cart_model.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/domain/usecase/add_or_remove_cart_usecase.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';

abstract class BaseAddOrRemoveCartRemoteDataSource {
  Future<AddOrRemoveCartModel> getAddOrRemoveCartData(AddOrRemoveCartParameters addOrRemoveCartParameters);
}


class AddOrRemoveCartRemoteDataSource extends BaseAddOrRemoveCartRemoteDataSource {
  @override
  Future<AddOrRemoveCartModel> getAddOrRemoveCartData(AddOrRemoveCartParameters addOrRemoveCartParameters) async {
    final AppPreferences _appPref = sl<AppPreferences>();
  Dio dio = Dio();
  final response = await dio.post(
  ApiConstance.add_or_remove_cart_Path,
  options: Options(headers: {
    'lang':'ar',
    'Content-Type':'Content-Type',
    'Authorization':'${_appPref.getToken()}',
  }),
  data: {"product_id": addOrRemoveCartParameters.productId},
  );
  return AddOrRemoveCartModel.fromJson(response.data);

  }
}