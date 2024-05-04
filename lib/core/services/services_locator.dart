import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:matgary/core/global/app_shared_pref.dart';
import 'package:matgary/core/network/netword_info.dart';
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
import 'package:matgary/product_details/domain/usecase/get_product_details_usecase.dart';
import 'package:matgary/product_details/presentation/controller/product_details_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async{

    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => HomeBloc(sl()));
    sl.registerFactory(() => ProductDetailsBloc(sl()));

    // SharedPreferences instance
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    // AppPreferences instance
    // final appPreferences = AppPreferences(instance());
    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    ///NetworkInfo instance
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
    // print("${GetIt.I.isRegistered<NetworkInfo>()} " + "NetworkInfo");


    /////////////////////////////////////////////////////////////////////

    // product details
    /// USE CASES For ProductDetails
    sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));
    /// Repository For ProductDetails
    sl.registerLazySingleton<BaseProductDetailsRepository>(() => ProductDetailsRepository(sl()));
    /// DATA SOURCE For ProductDetails
    sl.registerLazySingleton<BaseProductDetailsRemoteDataSource>(() => ProductDetailsRemoteDataSource());


    // Home
/////////////////////////////////////////////////////////////
    /// USE CASES For Home
    sl.registerLazySingleton(() => GetHomeUseCase(sl()));
    /// Repository For Home
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));
    /// DATA SOURCE For Home
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(() => HomeRemoteDataSource());

    //////////////////////////////////////////////////////////


    // Login
/////////////////////////////////////////////////////////////
    /// USE CASES For Login
    sl.registerLazySingleton(() => GetLoginUseCase(sl()));
    /// Repository For Login
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
    /// DATA SOURCE For Login
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());

    //////////////////////////////////////////////////////////
  }
}
