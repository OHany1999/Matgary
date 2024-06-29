import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_bloc.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_event.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_state.dart';
import 'package:matgary/carts/cart_page/presentation/screens/widgets/show_cart_widget.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/presentation/controller/update_cart_bloc/update_cart_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/3-delete_cart/presentation/controller/delete_cart_bloc/delete_cart_bloc.dart';
import 'package:matgary/carts/general%20_cart_apis/4-add_order/presentation/controller/add_order_bloc/add_order_bloc.dart';
import 'package:matgary/core/global/shared_widgets/error_widget.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/core/services/services_locator.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartScreen';

  CartScreen({super.key});

  List<CartItemEntity>? localCartItemEntity = [];
  dynamic localTotal = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<GetCartBloc>()..add(GetCartEvent())),
        BlocProvider(create: (context) => sl<UpdateCartBloc>()),
        BlocProvider(create: (context) => sl<DeleteCartBloc>()),
        BlocProvider(create: (context) => sl<AddOrderBloc>()),
      ],
      child: Scaffold(
        body: BlocBuilder<GetCartBloc, GetCartState>(
          buildWhen: (previous, current) =>
              previous.getCartRequestState != current.getCartRequestState,
          builder: (context, state) {
            switch (state.getCartRequestState) {
              case GetCartRequestState.initial:
                return Container();
              case GetCartRequestState.loading:
                if (localCartItemEntity!.isNotEmpty && localTotal != 0) {
                  return SafeArea(
                      child: Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      ShowCartWidget(
                        localCartItemEntity: localCartItemEntity,
                        localTotal: localTotal,
                        isActive: true,
                      ),
                    ],
                  ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }

              case GetCartRequestState.success:
                localTotal = state.getCartEntity!.data!.total;
                localCartItemEntity = state.getCartEntity!.data!.cartItems;
                return SafeArea(
                    child: localTotal == 0
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.remove_shopping_cart,
                                  size: 80,
                                  color: AppColorsLight.orangeColor3,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'لايوجد منتجات في العربة',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(fontSize: 28),
                                )
                              ],
                            ),
                          )
                        : ShowCartWidget(
                            localCartItemEntity: localCartItemEntity,
                            localTotal: localTotal,
                            isActive: false,
                          ));
              case GetCartRequestState.error:
                return ErrorWidgetWithReload(onPress: () {
                  context.read<GetCartBloc>().add(GetCartEvent());
                });
            }
          },
        ),
      ),
    );
  }
}
