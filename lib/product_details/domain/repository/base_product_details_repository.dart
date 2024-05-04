import 'package:dartz/dartz.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/product_details/domain/entities/home_details_entity.dart';
import 'package:matgary/product_details/domain/usecase/get_product_details_usecase.dart';

abstract class BaseProductDetailsRepository{

Future<Either<Failure,ProductDetailsEntity>> getProductDetailsData(ProductDetailsParameters productDetailsParameters);

}