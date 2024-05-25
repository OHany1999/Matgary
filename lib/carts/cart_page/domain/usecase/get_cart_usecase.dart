import 'package:dartz/dartz.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';
import 'package:matgary/carts/cart_page/domain/repository/base_get_cart_repository.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';

class GetCartUseCase extends BaseUseCase<GetCartEntity,NoParameters>{
final BaseGetCartRepository baseGetCartRepository;
GetCartUseCase(this.baseGetCartRepository);

@override
Future<Either<Failure, GetCartEntity>> call(NoParameters noParameters)async {
return await baseGetCartRepository.getCartData();
}
}
