
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_bloc.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_event.dart';
import 'package:matgary/carts/cart_page/presentation/controller/get_cats_bloc/get_cats_state.dart';
import 'package:matgary/core/global/shared_widgets/error_widget.dart';
import 'package:matgary/core/services/services_locator.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartScreen';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<GetCartBloc>()..add(GetCartEvent())),
      ],
      child: Scaffold(
        body: BlocBuilder<GetCartBloc,GetCartState>(
          buildWhen: (previous, current) => previous.getCartRequestState != current.getCartRequestState,
          builder: (context,state){
            switch(state.getCartRequestState){
              case GetCartRequestState.initial:
                return Container();
              case GetCartRequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case GetCartRequestState.success:
                return Center(child: Text(state.getCartEntity!.data!.cartItems!.length.toString()),);
              case GetCartRequestState.error:
                return ErrorWidgetWithReload(onPress: (){context.read<GetCartBloc>().add(GetCartEvent());});

            }
          },
        ),
      ),
    );
  }
}
