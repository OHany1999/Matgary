import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/domain/repository/base_delete_cart_repository.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/global/shared_models_and_entites/cart/upate_and_remove_cart_entity.dart';
import 'package:matgary/core/usecase/base_usecase.dart';

class DeleteCartUseCase extends BaseUseCase<UpdateAndDeleteCartEntity,DeleteCartParameters>{
final BaseDeleteCartRepository baseDeleteCartRepository;
DeleteCartUseCase(this.baseDeleteCartRepository);

@override
Future<Either<Failure, UpdateAndDeleteCartEntity>> call(DeleteCartParameters parameters)async {
return await baseDeleteCartRepository.getDeleteCartData(parameters);
}
}


class DeleteCartParameters extends Equatable {
  final int id;


  const DeleteCartParameters({required this.id});

  @override
  List<Object?> get props => [id];
}