import 'package:flutter/material.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';

class GlobalElevatedButton extends StatelessWidget {
  final void Function()? onPress;
  final Color? backGroundColor;
  final Size? bottomSize;
  final EdgeInsetsGeometry? bottomPadding;
  final String bottomText;

  const GlobalElevatedButton({super.key,
    required this.onPress,
    this.backGroundColor = AppColorsLight.orangeColor3,
    this.bottomSize= const Size(325, 55),
    this.bottomPadding=const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    this.bottomText="Log in",
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
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
