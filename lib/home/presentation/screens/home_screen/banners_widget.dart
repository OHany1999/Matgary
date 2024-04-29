import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannersWidget extends StatelessWidget {
  final List<dynamic>? myList;

  const BannersWidget({super.key,required,required this.myList,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CarouselSlider(
        items: myList!.map(
            (item){
              return  Image.network(
                item.image,
                width: double.maxFinite.w,
                height: double.maxFinite.h,
                fit: BoxFit.fill,
                errorBuilder: (context, object, stakTrac) {
                  return const Center(
                    child: Text('error load image'),
                  );

                },
              );
            }
        ).toList(),
        options: CarouselOptions(
          height: 150.h,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }
}


