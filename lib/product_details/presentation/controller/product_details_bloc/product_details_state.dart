import 'package:equatable/equatable.dart';
import 'package:matgary/product_details/domain/entities/home_details_entity.dart';


enum ProductDetailsRequestState{
  initial,
  loading,
  success,
  error,
}


class ProductDetailsState extends Equatable {
  final ProductDetailsEntity? productDetailsEntity;
  final ProductDetailsRequestState productDetailsRequestState;
  final String productDetailsMessage;


  const ProductDetailsState({
    this.productDetailsEntity,
    this.productDetailsRequestState = ProductDetailsRequestState.initial,
    this.productDetailsMessage = '',
  });


  ProductDetailsState copyWith({
    ProductDetailsEntity? productDetailsEntity,
    ProductDetailsRequestState? productDetailsRequestState,
    String? productDetailsMessage,
  }) {
    return ProductDetailsState(
      productDetailsEntity: productDetailsEntity ?? this.productDetailsEntity,
      productDetailsRequestState: productDetailsRequestState ?? this.productDetailsRequestState,
      productDetailsMessage: productDetailsMessage ?? this.productDetailsMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productDetailsEntity, productDetailsRequestState, productDetailsMessage];
}




