import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';
import 'package:matgary/home/domain/repository/base_home_repository.dart';

class GetHomeUseCase extends BaseUseCase<HomeEntity,NoParameters>{
  final BaseHomeRepository baseHomeRepository;
  GetHomeUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, HomeEntity>> call(NoParameters parameters)async {
    return await baseHomeRepository.getHomeData();
  }
}

