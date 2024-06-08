import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/carts/cart_page/domain/entities/get_cart_entity.dart';

class ShowCartWidget extends StatelessWidget {
  GetCartEntity? localGetCartEntity;

  ShowCartWidget({super.key, required this.localGetCartEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height-100.h,
              child: ListView.builder(
                itemCount: localGetCartEntity!.data!.cartItems!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.redAccent,
                    margin: EdgeInsets.only(top: 50.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          width: MediaQuery.of(context).size.width - 220,
                          height: 150.h,
                          fit: BoxFit.fitHeight,
                          imageUrl: localGetCartEntity!
                              .data!.cartItems![index].product!.image!,
                          placeholder: (context, url) => const Icon(
                            Icons.image,
                            size: 80,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image,
                            size: 80,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              color: Colors.green,
                              margin: const EdgeInsets.only(top: 10),
                              width: 140.w,
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
                            Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.only(top: 10),
                              width: 140.w,
                              child: Text(
                                '${localGetCartEntity!.data!.cartItems![index].product!.price.toString()} جنية',
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Container(height: 100.h,color: Colors.blue,),
      ],
    );
  }
}
