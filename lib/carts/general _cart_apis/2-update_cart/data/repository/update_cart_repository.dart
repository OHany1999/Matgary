import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/data/datasource/update_cart_datasource.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/repository/base_update_cart_repository.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/usecase/update_cart_usecase.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';


class UpdateCartRepository extends BaseUpdateCartRepository {
  final BaseUpdateCartRemoteDataSource baseUpdateCartRemoteDataSource;

  UpdateCartRepository(this.baseUpdateCartRemoteDataSource);

  @override
  Future<Either<Failure, SuccessEntity>> getUpdateCartData(
      UpdateCartParameters parameters) async {
    try {
      final result =
          await baseUpdateCartRemoteDataSource.getUpdateCartData(parameters);
      return Right(result);
    } on Exception catch (error) {
      return left(Failure(error.hashCode, error.toString()));
    }
  }
}
