import 'package:dio/dio.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/product_details/data/model/home_details_model.dart';
import 'package:matgary/product_details/domain/usecase/get_product_details_usecase.dart';

abstract class BaseProductDetailsRemoteDataSource {
  Future<ProductDetailsModel> getProductDetailsData(ProductDetailsParameters productDetailsParameters);
}


class ProductDetailsRemoteDataSource extends BaseProductDetailsRemoteDataSource {
  @override
  Future<ProductDetailsModel> getProductDetailsData(ProductDetailsParameters productDetailsParameters) async {
    Dio dio = Dio();
    final response = await dio.get(
      ApiConstance.products_details_Path(id: productDetailsParameters.id),
      queryParameters: {
        'Content-Type':'application/json',
        'lang':'en',
        // 'Authorization':'${_appPref.getToken()}',
        'Authorization':'GNgoFznYCAlWPWEkaD7yAOX9aXOpMVALb5Hfh3YPgYPsv2ejEcLRY6qSPppjWxh91B6Z6v',
      },
    );
    return ProductDetailsModel.fromJson(response.data);
  }
}
