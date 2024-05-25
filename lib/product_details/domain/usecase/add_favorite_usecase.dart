import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/product_details/domain/entities/add_favorite_entity.dart';
import 'package:matgary/product_details/domain/repository/base_product_details_repository.dart';

class AddFavoriteUseCase extends BaseUseCase<AddFavoriteEntity, AddFavoriteParameters> {
  final BaseProductDetailsRepository baseProductDetailsRepository;

  AddFavoriteUseCase(this.baseProductDetailsRepository);

  @override
  Future<Either<Failure, AddFavoriteEntity>> call(
      AddFavoriteParameters addFavoriteParameters) async {
    return await baseProductDetailsRepository
        .addFavoriteData(addFavoriteParameters);
  }
}

class AddFavoriteParameters extends Equatable {
  final int id;

  const AddFavoriteParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
