import 'package:dartz/dartz.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/domain/entities/add_order_entity.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/domain/repository/base_add_order_repository.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';

class AddOrderUseCase extends BaseUseCase<AddOrderEntity, NoParameters>{
final BaseAddOrderRepository baseAddOrderRepository;
AddOrderUseCase(this.baseAddOrderRepository);

@override
Future<Either<Failure, AddOrderEntity>> call(NoParameters noParameters)async {
return await baseAddOrderRepository.getAddOrderData();
}
}


