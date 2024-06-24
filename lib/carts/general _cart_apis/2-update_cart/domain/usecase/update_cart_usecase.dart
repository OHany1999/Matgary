import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/domain/repository/base_update_cart_repository.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/Success_entity.dart';
import 'package:matgary/core/usecase/base_usecase.dart';

class UpdateCartUseCase extends BaseUseCase<SuccessEntity,UpdateCartParameters>{
final BaseUpdateCartRepository baseUpdateCartRepository;
UpdateCartUseCase(this.baseUpdateCartRepository);

@override
Future<Either<Failure, SuccessEntity>> call(UpdateCartParameters Parameters)async {
return await baseUpdateCartRepository.getUpdateCartData(Parameters);
}
}


class UpdateCartParameters extends Equatable {
  final int quantity;
  final int id;


  const UpdateCartParameters({required this.quantity,required this.id});

  @override
  List<Object?> get props => [quantity,id];
}
