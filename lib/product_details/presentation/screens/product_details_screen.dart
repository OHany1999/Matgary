import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/core/global/shared_widgets/error_widget.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';
import 'package:matgary/home/data/model/home_model.dart';
import 'package:matgary/product_details/presentation/controller/product_details_bloc/product_details_bloc.dart';
import 'package:matgary/product_details/presentation/controller/product_details_bloc/product_details_event.dart';
import 'package:matgary/product_details/presentation/controller/product_details_bloc/product_details_state.dart';
import 'package:matgary/product_details/presentation/screens/wedgits/add_cart_image_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static const routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<ProductDetailsBloc>()
              ..add(GetProductDetailsEvent(id: arg.id!))),
      ],
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        buildWhen: (previous, current) {
          if (previous.productDetailsRequestState !=
              current.productDetailsRequestState) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, state) {
          print('my product details state ${state.productDetailsRequestState}');
          switch (state.productDetailsRequestState) {
            case ProductDetailsRequestState.initial:
              return const Scaffold(
                body: Center(
                  child: Text('initial'),
                ),
              );
            case ProductDetailsRequestState.loading:
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
            case ProductDetailsRequestState.success:
              print('network is fav :${state.productDetailsEntity!.data!.inFavorites}');
              return Scaffold(
                body: RefreshIndicator(
                  onRefresh: (){
                    context
                        .read<ProductDetailsBloc>()
                        .add(GetProductDetailsEvent(id: arg.id!));
                       return Future(() => null);
                  },
                  child: SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: AddCartImageWidget(
                            productDetailsEntity: state.productDetailsEntity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            case ProductDetailsRequestState.error:
              return Scaffold(
                body: ErrorWidgetWithReload(onPress: (){
                  context
                      .read<ProductDetailsBloc>()
                      .add(GetProductDetailsEvent(id: arg.id!));
                }),
              );
          }
        },
      ),
    );
  }
}
