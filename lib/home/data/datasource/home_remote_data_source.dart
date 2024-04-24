import 'package:dio/dio.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/home/data/model/home_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHomeData();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  final AppPreferences _appPref = sl<AppPreferences>();
  @override
  Future<HomeModel> getHomeData() async {
    Dio dio = Dio();
    final response = await dio.get(
      ApiConstance.homePath,
      queryParameters: {
        'Content-Type':'application/json',
        'lang':'en',
        'Authorization':'${_appPref.getToken()}',
      },
    );
    return HomeModel.fromJson(response.data);
  }
}
