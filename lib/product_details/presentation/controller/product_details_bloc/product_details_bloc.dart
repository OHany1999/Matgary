import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/product_details/domain/usecase/get_product_details_usecase.dart';
import 'package:matgary/product_details/presentation/controller/product_details_bloc/product_details_event.dart';
import 'package:matgary/product_details/presentation/controller/product_details_bloc/product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc(this.getProductDetailsUseCase)
      : super(const ProductDetailsState()) {
    on<GetProductDetailsEvent>(_getProductDetails);
  }


  FutureOr<void> _getProductDetails(
      GetProductDetailsEvent event, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(
        productDetailsRequestState: ProductDetailsRequestState.loading));
    final result =
        await getProductDetailsUseCase(ProductDetailsParameters(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(productDetailsMessage: l.message,productDetailsRequestState: ProductDetailsRequestState.error)),
      (r) => emit(state.copyWith(productDetailsEntity: r,productDetailsRequestState: ProductDetailsRequestState.success)),
    );
  }
}
