import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/product_details/domain/entities/home_details_entity.dart';

class AddCartImageWidget extends StatelessWidget {
  ProductDetailsEntity? productDetailsEntity;

  AddCartImageWidget({super.key, required this.productDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          productDetailsEntity!.data!.image!,
          width: MediaQuery.of(context).size.width,
          height: 340.h,
        ),
      ],
    );
  }
}
