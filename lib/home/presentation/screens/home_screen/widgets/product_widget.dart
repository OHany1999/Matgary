import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/product_details/presentation/screens/product_details_screen.dart';

class ProductWidget extends StatelessWidget {
  final List<dynamic>? myList;

  const ProductWidget({super.key, required this.myList});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: myList!.length,
        (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                  arguments: myList![index]);
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              elevation: 0.0,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        width: double.infinity.w,
                        height: 120,
                        fit:BoxFit.fitHeight,
                        imageUrl: myList![index].image!,
                        placeholder: (context, url) =>const Icon(
                          Icons.image,
                          size: 80,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image,
                          size: 80,

                        ),
                      ),
                      if (myList![index].discount != 0)
                        Positioned(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColorsLight.orangeColor3,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                            ),
                            width: 60,
                            height: 30,
                            child: Text(
                              '${myList![index].discount.toString()}% off',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    '...${myList![index].name!.substring(0, 15)}',
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('${myList![index].price!.toString()} EGP',
                      textAlign: TextAlign.center),
                  if (myList![index].discount != 0)
                    Text(
                      '${myList![index].oldPrice!} EGP',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // number of items in each row
        mainAxisSpacing: 8.0,
        // spacing between rows
        crossAxisSpacing: 8.0,
        // spacing between columns
        childAspectRatio: 1 / 1.2, // (width/height)
      ),
    );
  }
}
