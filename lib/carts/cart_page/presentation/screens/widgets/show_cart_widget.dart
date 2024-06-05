import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                width: MediaQuery.of(context).size.width,
                color: Colors.redAccent,
                margin: EdgeInsets.only(top: 50.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      width: MediaQuery.of(context).size.width -220,
                      height: 200.h,
                      fit: BoxFit.fitHeight,
                      imageUrl: localGetCartEntity!.data!.cartItems![index].product!.image!,
                      placeholder: (context, url) => const Icon(
                        Icons.image,
                        size: 80,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image,
                        size: 80,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                          localGetCartEntity!
                              .data!.cartItems![index].product!.name
                              .toString(),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 15.0),
                      ),
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
