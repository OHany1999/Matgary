import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';


class ProductWidget extends StatelessWidget {
  final List<dynamic>? myList;

  const ProductWidget({super.key,required this.myList});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // number of items in each row
          mainAxisSpacing: 8.0,
          // spacing between rows
          crossAxisSpacing: 8.0,
          // spacing between columns
          childAspectRatio: 1 / 1.2, // (width/height)
        ),
        padding: const EdgeInsets.all(8.0),
        // padding around the grid
        itemCount: myList!.length,
        // total number of items
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.white,
              elevation: 0.0,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        myList![index].image!,
                        height: 110,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder:
                            (context, object, stackTrac) {
                          return const Center(
                            child: Text('error load image'),
                          );
                        },
                      ),
                      if (myList![index].discount != 0)
                        Positioned(
                          child: Container(
                            color:
                            AppColorsLight.orangeColor3,
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
                  if (myList![index].discount != 0)
                    Text(
                      '${myList![index].oldPrice!} EGP',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        decoration:
                        TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                  Text(
                      '${myList![index].price!.toString()} EGP',
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
