import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_bloc.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_event.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_state.dart';
import 'package:matgary/carts/cart_page/presentation/screens/widgets/show_cart_widget.dart';
import 'package:matgary/carts/general%20_cart_apis/2-update_cart/presentation/controller/update_cart_bloc/update_cart_bloc.dart';
import 'package:matgary/core/global/shared_widgets/error_widget.dart';
import 'package:matgary/core/services/services_locator.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartScreen';

  CartScreen({super.key});

  List<CartItemEntity>? localCartItemEntity = [];
  int? localTotal = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<GetCartBloc>()..add(GetCartEvent())),
        BlocProvider(create: (context) => sl<UpdateCartBloc>()),
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
                if(localCartItemEntity!.isNotEmpty && localTotal != 0){
                  return SafeArea(
                      child: Stack(
                        children: [
                          const Center(child: CircularProgressIndicator()),
                          ShowCartWidget(localCartItemEntity: localCartItemEntity,localTotal: localTotal,isActive: true,),
                        ],
                      ));
                }else{
                  return const Center(child: CircularProgressIndicator());
                }

              case GetCartRequestState.success:
                 localTotal = state.getCartEntity!.data!.total;
                localCartItemEntity = state.getCartEntity!.data!.cartItems;
                return SafeArea(
                    child: ShowCartWidget(localCartItemEntity: localCartItemEntity,localTotal: localTotal,isActive: false,));
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
