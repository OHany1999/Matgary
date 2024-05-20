
import 'package:dio/dio.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/network/api_constance.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/favorite/data/model/delete_favorite_model.dart';

import 'package:matgary/favorite/data/model/favorite_list_model.dart';

abstract class BaseFavoriteListRemoteDataSource {
Future<FavoriteListModel> getFavoriteListData();
Future<DeleteFavoriteModel> deleteFavoriteData(int id);
}


class FavoriteListRemoteDataSource extends BaseFavoriteListRemoteDataSource {
  @override
  Future<FavoriteListModel> getFavoriteListData() async{
    final AppPreferences _appPref = sl<AppPreferences>();
    Dio dio = Dio();

    final response = await dio.get(
      ApiConstance.favoriteListPath,
      options: Options(headers: {
        'lang':'ar',
        'Content-Type':'application/json',
        'Authorization':'${_appPref.getToken()}',
      }),
    );
    return FavoriteListModel.formJson(response.data);
  }

  @override
  Future<DeleteFavoriteModel> deleteFavoriteData(int id)async {
      final AppPreferences _appPref = sl<AppPreferences>();
      Dio dio = Dio();

      final response = await dio.delete(
          '${ApiConstance.favoriteListPath}/$id',
        options: Options(headers: {
          'lang':'ar',
          'Content-Type':'application/json',
          'Authorization':'${_appPref.getToken()}',
        }),

      );
      return DeleteFavoriteModel.fromJson(response.data);

  }


}