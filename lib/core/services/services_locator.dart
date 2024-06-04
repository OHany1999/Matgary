import 'package:get_it/get_it.dart';
import 'package:matgary/carts/cart_page/data/datasource/get_cart_datasource.dart';
import 'package:matgary/carts/cart_page/domain/repository/base_get_cart_repository.dart';
import 'package:matgary/carts/cart_page/domain/usecase/get_cart_usecase.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/data/datasource/add_or_remove_cart_datasource.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/data/repository/add_or_remove_cart_repository.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/domain/repository/base_add_or_remove_cart_repository.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/domain/usecase/add_or_remove_cart_usecase.dart';
import 'package:matgary/carts/general%20_cart_apis/1-add_or_remove_cart/presentation/controller/add_or_remove_cart_bloc/add_or_remove_cart_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/data/datasource/update_cart_datasource.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/data/repository/update_cart_repository.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/repository/base_update_cart_repository.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/usecase/update_cart_usecase.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/presentation/controller/update_cart_bloc/update_cart_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/data/datasource/delete_cart_datasource.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/data/repository/delete_cart_repository.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/repository/base_delete_cart_repository.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/usecase/delete_cart_usecase.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/presentation/controller/delete_cart_bloc/delete_cart_bloc.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/favorite/data/datasource/favorite_list_remote_data_source.dart';
import 'package:matgary/favorite/data/repository/favorite_list_repository.dart';
import 'package:matgary/favorite/domain/repository/base_favorite_list_repository.dart';
import 'package:matgary/favorite/domain/usecase/favorite_list_usecase.dart';
import 'package:matgary/favorite/presentation/controller/delete_favorite_bloc/delete_favorite_bloc.dart';
import 'package:matgary/favorite/presentation/controller/favorite_list_bloc/favorite_list_bloc.dart';
import 'package:matgary/home/data/datasource/home_remote_data_source.dart';
import 'package:matgary/home/data/repository/home_repository.dart';
import 'package:matgary/home/domain/repository/base_home_repository.dart';
import 'package:matgary/home/domain/usecase/get_home_usecase.dart';
import 'package:matgary/home/presentation/controller/home_bloc/home_bloc.dart';
import 'package:matgary/login/data/datasource/login_remote_data_source.dart';
import 'package:matgary/login/data/repository/login_repository.dart';
import 'package:matgary/login/domain/repository/base_login_repository.dart';
import 'package:matgary/login/domain/usecase/get_login_usecase.dart';
import 'package:matgary/login/presentation/controller/login_bloc.dart';
import 'package:matgary/product_details/data/datasource/product_details_remote_data_source.dart';
import 'package:matgary/product_details/data/repository/product_details_repository.dart';
import 'package:matgary/product_details/domain/repository/base_product_details_repository.dart';
import 'package:matgary/product_details/domain/usecase/add_favorite_usecase.dart';
import 'package:matgary/product_details/domain/usecase/get_product_details_usecase.dart';
import 'package:matgary/product_details/presentation/controller/add_and_remove_favorite_bloc/add_and_remove_favorite_bloc.dart';
import 'package:matgary/product_details/presentation/controller/product_details_bloc/product_details_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../carts/cart_page/data/repository/get_cats_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async{

    // SharedPreferences instance
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    // AppPreferences instance
    // final appPreferences = AppPreferences(instance());
    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));
    
    
    /////////////////////////////////////////////////////////

    // DeleteCart
    sl.registerFactory(() => DeleteCartBloc(sl()));


    /// USE CASES For DeleteCart
    sl.registerLazySingleton(() => DeleteCartUseCase(sl()));
    /// Repository For DeleteCart
    sl.registerLazySingleton<BaseDeleteCartRepository>(() => DeleteCartRepository(sl()));
    /// DATA SOURCE For DeleteCart
    sl.registerLazySingleton<BaseDeleteCartRemoteDataSource>(() => DeleteCartRemoteDataSource());



    ///////////////////////////////////////////////////////////
    
    // UpdateCart
    sl.registerFactory(() => UpdateCartBloc(sl()));

    /// USE CASES For UpdateCart
    sl.registerLazySingleton(() => UpdateCartUseCase(sl()));
    /// Repository For UpdateCart
    sl.registerLazySingleton<BaseUpdateCartRepository>(() => UpdateCartRepository(sl()));
    /// DATA SOURCE For UpdateCart
    sl.registerLazySingleton<BaseUpdateCartRemoteDataSource>(() => UpdateCartRemoteDataSource());


    /////////////////////////////////////////////////

    // getCarts

    sl.registerFactory(() => GetCartBloc(sl()));
    /// USE CASES For GetCart
    sl.registerLazySingleton(() => GetCartUseCase(sl()));
    /// Repository For GetCart
    sl.registerLazySingleton<BaseGetCartRepository>(() => GetCartRepository(sl()));
    /// DATA SOURCE For GetCart
    sl.registerLazySingleton<BaseGetCartRemoteDataSource>(() => GetCartRemoteDataSource());




    ////////////////////////////////////////////////////

    //addOrRemoveCart
    sl.registerFactory(() => AddOrRemoveCartBloc(sl()));
    /// USE CASES For AddOrRemoveCart
    sl.registerLazySingleton(() => AddOrRemoveCartUseCase(sl()));
    /// Repository For AddOrRemoveCart
    sl.registerLazySingleton<BaseAddOrRemoveCartRepository>(() => AddOrRemoveCartRepository(sl()));
    /// DATA SOURCE For AddOrRemoveCart
    sl.registerLazySingleton<BaseAddOrRemoveCartRemoteDataSource>(() => AddOrRemoveCartRemoteDataSource());



    /////////////////////////////////////////////////////////

    // deleteFavorite
    sl.registerFactory(() => DeleteFavoriteBloc(sl()));
    sl.registerLazySingleton(() => DeleteFavoriteUseCase(sl()));
    /// Repository For  deleteFavorite  with favoriteList
    /// DATA SOURCE For deleteFavorite  with favoriteList
    /// already exist


  //////////////////////////////////////////////////////////

    //favoriteList
    sl.registerFactory(() => FavoriteListBloc(sl()));
    /// USE CASES For favoriteList
    sl.registerLazySingleton(() => GetFavoriteListUseCase(sl()));
    /// Repository For favoriteList
    sl.registerLazySingleton<BaseFavoriteListRepository>(() => FavoriteListRepository(sl()));
    /// DATA SOURCE For favoriteList
    sl.registerLazySingleton<BaseFavoriteListRemoteDataSource>(() => FavoriteListRemoteDataSource());



    /////////////////////////////////////////////////////////////////////

    // Add and Remove Favorite
    sl.registerFactory(() => AddAndRemoveFavoriteBloc(sl()));
    sl.registerLazySingleton(() => AddFavoriteUseCase(sl()));
    /// Repository For  favorite  with ProductDetails
    /// DATA SOURCE For favorite  with ProductDetails
    /// already exist



    /////////////////////////////////////////////////////////////////////

    // product details
    sl.registerFactory(() => ProductDetailsBloc(sl()));
    /// USE CASES For ProductDetails
    sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));
    /// Repository For ProductDetails
    sl.registerLazySingleton<BaseProductDetailsRepository>(() => ProductDetailsRepository(sl()));
    /// DATA SOURCE For ProductDetails
    sl.registerLazySingleton<BaseProductDetailsRemoteDataSource>(() => ProductDetailsRemoteDataSource());

/////////////////////////////////////////////////////////////

    // Home

    sl.registerFactory(() => HomeBloc(sl()));
    /// USE CASES For Home
    sl.registerLazySingleton(() => GetHomeUseCase(sl()));
    /// Repository For Home
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));
    /// DATA SOURCE For Home
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(() => HomeRemoteDataSource());

    //////////////////////////////////////////////////////////

    // Login
    sl.registerFactory(() => LoginBloc(sl()));
    /// USE CASES For Login
    sl.registerLazySingleton(() => GetLoginUseCase(sl()));
    /// Repository For Login
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
    /// DATA SOURCE For Login
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());

    //////////////////////////////////////////////////////////
  }
}
