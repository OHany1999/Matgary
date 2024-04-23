import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matgary/core/global/theme/app_color/app_color_light.dart';

class GlobalTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final bool addSuffixIcon;
  final void Function()? suffixIconOnPress;
  final Widget suffixIconImage;
  final Color borderSideColor;
  final String? Function(String?)? validator;
  final Color? textColor;


  GlobalTextField({
    required this.textEditingController,
    this.focusNode = null,
    this.obscureText = false,
    required this.keyboardType,
    required this.prefixIcon,
    this.addSuffixIcon = false,
    this.suffixIconOnPress = null,
    this.suffixIconImage = const SizedBox(),
    this.borderSideColor = AppColorsLight.textFieldColor,
    required this.validator,
    this.textColor =Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: textColor),
      controller: textEditingController,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColorsLight.textFieldColor,
        prefixIcon: prefixIcon,
        suffixIcon: addSuffixIcon == true ? IconButton(
            onPressed: suffixIconOnPress,
            icon: suffixIconImage,
        ):null,
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
    );
  }
}
