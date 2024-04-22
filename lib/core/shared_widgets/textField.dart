import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final bool addSuffixIcon;
  final void Function()? suffixIconOnPress;
  final Widget suffixIconImage;
  final InputBorder? inputBorder;
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
    required this.inputBorder,
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
        prefixIcon: prefixIcon,
        suffixIcon: addSuffixIcon == true ? IconButton(
            onPressed: suffixIconOnPress,
            icon: suffixIconImage,
        ):null,
        border: inputBorder,
        enabledBorder: inputBorder,
      ),
      validator: validator,
    );
  }
}
