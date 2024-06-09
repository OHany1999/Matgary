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

  GetCartEntity? localGetCartEntity;
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
                return const Center(child: CircularProgressIndicator());
              case GetCartRequestState.success:
                var stateGetCart = state.getCartEntity;
                localGetCartEntity = stateGetCart;
                return SafeArea(
                    child: ShowCartWidget(
                  localGetCartEntity: localGetCartEntity,
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
