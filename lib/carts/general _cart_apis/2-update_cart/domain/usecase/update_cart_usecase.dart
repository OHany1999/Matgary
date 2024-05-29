import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/entities/update_cart_entity.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/repository/base_update_cart_repository.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';

class UpdateCartUseCase extends BaseUseCase<UpdateCartEntity,UpdateCartParameters>{
final BaseUpdateCartRepository baseUpdateCartRepository;
UpdateCartUseCase(this.baseUpdateCartRepository);

@override
Future<Either<Failure, UpdateCartEntity>> call(UpdateCartParameters Parameters)async {
return await baseUpdateCartRepository.getUpdateCartData(Parameters);
}
}


class UpdateCartParameters extends Equatable {
  final int quantity;


  const UpdateCartParameters({required this.quantity});

  @override
  List<Object?> get props => [quantity];
}
