import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final bool addSuffixIcon;
  final void Function()? suffixIconOnPress;
  final Widget suffixIconImage;
  final InputBorder? inputBorder;
  final String? Function(String?)? validator;

  GlobalTextField({
    required this.textEditingController,
    required this.focusNode,
    this.obscureText = false,
    required this.textInputType,
    required this.prefixIcon,
    this.addSuffixIcon = false,
    this.suffixIconOnPress = null,
    this.suffixIconImage = const SizedBox(),
    required this.inputBorder,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: textInputType,
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
