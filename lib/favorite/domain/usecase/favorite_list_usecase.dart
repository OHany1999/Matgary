import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/favorite/domain/entities/favorite_list_entity.dart';
import 'package:matgary/favorite/domain/repository/favorite_list_repository.dart';

class GetFavoriteListUseCase
    extends BaseUseCase<FavoriteListEntity, NoParameters> {
  final BaseFavoriteListRepository baseFavoriteListRepository;

  GetFavoriteListUseCase(this.baseFavoriteListRepository);

  @override
  Future<Either<Failure, FavoriteListEntity>> call(NoParameters noParameters) async {
    return await baseFavoriteListRepository.getFavoriteListData();
  }
}
