import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/domain/entities/add_or_remove_cart_entity.dart';
import 'package:matgary/cards/general%20_cart_apis/1-add_or_remove_cart/domain/repository/base_add_or_remove_cart_repository.dart';
import 'package:matgary/core/error/failure.dart';
import 'package:matgary/core/usecase/base_usecase.dart';

class GetAddOrRemoveCartUseCase extends BaseUseCase<AddOrRemoveCartEntity,AddOrRemoveCartParameters>{
final BaseAddOrRemoveCartRepository baseAddOrRemoveCartRepository;
GetAddOrRemoveCartUseCase(this.baseAddOrRemoveCartRepository);

@override
Future<Either<Failure, AddOrRemoveCartEntity>> call(AddOrRemoveCartParameters addOrRemoveCartParameters)async {
return await baseAddOrRemoveCartRepository.getAddOrRemoveCartData(addOrRemoveCartParameters);
}
}


class AddOrRemoveCartParameters extends Equatable {
  final int productId;


  const AddOrRemoveCartParameters({required this.productId});

  @override
  List<Object?> get props => [productId];
}