import 'package:get_it/get_it.dart';
import 'package:matgary/login/data/datasource/login_remote_data_source.dart';
import 'package:matgary/login/data/repository/login_repository.dart';
import 'package:matgary/login/domain/repository/base_login_repository.dart';
import 'package:matgary/login/domain/usecase/get_login_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

    /// USE CASES
    sl.registerLazySingleton(() => GetLoginUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());
  }
}
