import 'package:dio/dio.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/product_details/data/model/add_favorite_model.dart';
import 'package:matgary/product_details/data/model/home_details_model.dart';
import 'package:matgary/product_details/domain/usecase/add_favorite_usecase.dart';
import 'package:matgary/product_details/domain/usecase/get_product_details_usecase.dart';

final AppPreferences _appPref = sl<AppPreferences>();

abstract class BaseProductDetailsRemoteDataSource {
  Future<ProductDetailsModel> getProductDetailsData(ProductDetailsParameters productDetailsParameters);
  Future<AddFavoriteModel> getAddFavoriteData(AddFavoriteParameters addFavoriteParameters);
}


class ProductDetailsRemoteDataSource extends BaseProductDetailsRemoteDataSource {
  @override
  Future<ProductDetailsModel> getProductDetailsData(ProductDetailsParameters productDetailsParameters) async {
    Dio dio = Dio();
    final response = await dio.get(
      ApiConstance.products_details_Path(id: productDetailsParameters.id),
      options: Options(headers: {
        'Content-Type':'application/json',
        'lang':'en',
        'Authorization':'${_appPref.getToken()}',
      }),
    );
    return ProductDetailsModel.fromJson(response.data);
  }

  @override
  Future<AddFavoriteModel> getAddFavoriteData(AddFavoriteParameters addFavoriteParameters) {
    // TODO: implement getAddFavoriteData
    throw UnimplementedError();
  }
}




