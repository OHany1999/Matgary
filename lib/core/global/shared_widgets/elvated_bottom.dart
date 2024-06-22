import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';

class GlobalElevatedButton extends StatelessWidget {
  final void Function()? onPress;
  final Color? backGroundColor;
  final Size? bottomSize;
  final EdgeInsetsGeometry? bottomPadding;
  final String bottomText;
  final double? fontSize;


  const GlobalElevatedButton({super.key,
    required this.onPress,
    this.backGroundColor = AppColorsLight.orangeColor3,
    this.bottomSize= const Size(325, 55),
    this.bottomPadding= const EdgeInsets.symmetric(vertical: 15),
    this.bottomText="تسجبل الدخول",
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
        fixedSize: bottomSize,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: bottomPadding,
      ),
      child: Text(
        bottomText,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: fontSize),
      ),
    );
  }
}
