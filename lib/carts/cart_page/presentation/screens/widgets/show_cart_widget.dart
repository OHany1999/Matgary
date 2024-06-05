import 'package:flutter/material.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';

class ShowCartWidget extends StatelessWidget {
  GetCartEntity? localGetCartEntity;

  ShowCartWidget({super.key, required this.localGetCartEntity});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: localGetCartEntity!.data!.cartItems!.length,
            (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text(localGetCartEntity!
                        .data!.cartItems![index].product!.name
                        .toString()),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
