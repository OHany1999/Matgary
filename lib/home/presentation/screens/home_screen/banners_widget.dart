import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';
import 'package:matgary/home/presentation/controller/slider_indicator_bloc/slider_indicator_bloc.dart';
import 'package:matgary/home/presentation/controller/slider_indicator_bloc/slider_indicator_event.dart';
import 'package:matgary/home/presentation/controller/slider_indicator_bloc/slider_indicator_state.dart';

class BannersWidget extends StatelessWidget {
  final List<dynamic>? myList;

  const BannersWidget({
    super.key,
    required,
    required this.myList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderIndicatorBloc, SliderIndicatorState>(
        builder: (context, state) {
      return Container(
        height: 200.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              items: myList!.map((item) {
                return Image.network(
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
              }).toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  context
                      .read<SliderIndicatorBloc>()
                      .add(SliderIndicatorEvent(tabIndex: index));
                },
                viewportFraction: 1,
                height: 150.h,
                autoPlay: true,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                dotsCount: myList!.length,
                position: state.selectedIndex,
                decorator: DotsDecorator(
                  color: AppColorsLight.grayColor,
                  activeColor: AppColorsLight.orangeColor3,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
