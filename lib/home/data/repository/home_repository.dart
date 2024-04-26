import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/error_handler.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/home/data/datasource/home_remote_data_source.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';
import 'package:matgary/home/domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository{
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, HomeEntity>> getHomeData()async {
    try{
      final result = await baseHomeRemoteDataSource.getHomeData();
      return Right(result);
    }on Exception catch(error){
      return left(Failure(error.hashCode, error.toString()));
    }
  }
}



//catch(error){
//       return Left(ErrorHandler.handle(error).failure);
//     }
//   }