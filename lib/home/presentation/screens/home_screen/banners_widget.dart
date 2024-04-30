import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        margin: EdgeInsets.only(top: 9.h),
        height: 200.h,
        child: CarouselSlider(
          items: myList!.map((item) {
            return Stack(
              children: [
                Image.network(
                  item.image,
                  width: double.maxFinite.w,
                  height: double.maxFinite.h,
                  fit: BoxFit.fill,
                  errorBuilder: (context, object, stakTrac) {
                    return const Center(
                      child: Text('error load image'),
                    );
                  },
                ),
                DotsIndicator(
                  dotsCount: myList!.length,
                  position: state.selectedIndex,
                ),
              ],
            );
          }).toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              context
                  .read<SliderIndicatorBloc>()
                  .add(SliderIndicatorEvent(tabIndex: index));
            },
            height: 150.h,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
          ),
        ),
      );
    });
  }
}
