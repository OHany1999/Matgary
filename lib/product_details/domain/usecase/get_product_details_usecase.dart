import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';
import 'package:matgary/product_details/domain/entities/home_details_entity.dart';
import 'package:matgary/product_details/domain/repository/base_product_details_repository.dart';


class GetProductDetailsUseCase extends BaseUseCase<ProductDetailsEntity, ProductDetailsParameters> {
  final BaseProductDetailsRepository baseProductDetailsRepository;

  GetProductDetailsUseCase(this.baseProductDetailsRepository);

  @override
  Future<Either<Failure,ProductDetailsEntity>> call(ProductDetailsParameters productDetailsParameters)async {
    return await baseProductDetailsRepository.getProductDetailsData(productDetailsParameters);
  }
}

class ProductDetailsParameters extends Equatable {
  final int id;


  const ProductDetailsParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
