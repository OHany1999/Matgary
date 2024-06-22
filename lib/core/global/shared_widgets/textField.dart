import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';

class GlobalTextField extends StatelessWidget {
  final double? textFieldWidth;
  final double? textFieldHeight;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool addPrefixIcon;
  final void Function()? addPrefixIconOnPress;
  final Widget addPrefixIconImage;
  final Color borderSideColor;
  final String? Function(String?)? validator;
  final Color? textColor;


  GlobalTextField({
    this.textFieldWidth = 400,
    this.textFieldHeight = 45,
    required this.textEditingController,
    this.focusNode = null,
    this.obscureText = false,
    required this.keyboardType,
    required this.suffixIcon,
    this.addPrefixIcon = false,
    this.addPrefixIconOnPress = null,
    this.addPrefixIconImage = const SizedBox(),
    this.borderSideColor = AppColorsLight.textFieldColor,
    required this.validator,
    this.textColor =Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: textFieldWidth!.w,
      height: textFieldHeight!.h,
      child: TextFormField(
        textAlign: TextAlign.right,
        cursorColor: AppColorsLight.orangeColor3,
        style: TextStyle(color: textColor),
        controller: textEditingController,
        focusNode: focusNode,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColorsLight.textFieldColor,
          prefixIcon: addPrefixIcon == true ? IconButton(
            onPressed: addPrefixIconOnPress,
            icon: addPrefixIconImage,
          ):null,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderSideColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: borderSideColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: borderSideColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
