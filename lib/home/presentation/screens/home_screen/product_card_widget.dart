import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/home/domain/entities/home_entity.dart';

class ProductCardWidget extends StatelessWidget {
  final List<ProductsEntity>? productList;
  final int index;

  const ProductCardWidget({super.key,required this.productList,required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                productList![index].image!,
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
              if (productList![index].discount != 0)
                Positioned(
                  child: Container(
                    color:
                    AppColorsLight.orangeColor3,
                    width: 60,
                    height: 30,
                    child: Text(
                      '${productList![index].discount.toString()}% off',
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
            '...${productList![index].name!.substring(0, 15)}',
            overflow: TextOverflow.clip,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.h,
          ),
          if (productList![index].discount != 0)
            Text(
              '${productList![index].oldPrice!} EGP',
              textAlign: TextAlign.center,
              style: const TextStyle(
                decoration:
                TextDecoration.lineThrough,
                color: Colors.red,
              ),
            ),
          Text(
              '${productList![index].price!.toString()} EGP',
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
