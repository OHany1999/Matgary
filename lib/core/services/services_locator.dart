import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:matgary/core/global/check_connection_bloc/check_connection_bloc.dart';
import 'package:matgary/core/network/netword_info.dart';
import 'package:matgary/login/data/datasource/login_remote_data_source.dart';
import 'package:matgary/login/data/repository/login_repository.dart';
import 'package:matgary/login/domain/repository/base_login_repository.dart';
import 'package:matgary/login/domain/usecase/get_login_usecase.dart';
import 'package:matgary/login/presentation/controller/login_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => CheckConnectionBloc(sl()));

    ///NetworkInfo instance
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
    // print("${GetIt.I.isRegistered<NetworkInfo>()} " + "NetworkInfo");

    /// USE CASES
    sl.registerLazySingleton(() => GetLoginUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl(),sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());
  }
}
