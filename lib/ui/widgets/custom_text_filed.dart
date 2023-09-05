import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Icon? prefix;
  final IconButton? suffixButton;
  final bool obscureText;
  final TextInputType textInputType;
  final Icon? suffix;
  final int? maxLength;
  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;

  CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.prefix,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.suffix,
    this.controller,
    this.validator,
    this.maxLength,
    this.suffixButton,
    // required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      maxLength: maxLength,
      validator: validator,
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
            color: Colors.white
        ),
        suffix: suffixButton,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.white
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
        ),
      ),
    );
  }
}
