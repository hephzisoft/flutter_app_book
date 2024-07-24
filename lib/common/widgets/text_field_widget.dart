import 'package:app_book/common/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.controller,
    this.hintText = 'Email Address',
    this.validator,
    this.obscureText = false,
    this.isPasswordField = false,
    this.suffixIcon,
    this.inputType = TextInputType.text,
    this.label = "Email Address",
  });
  final TextEditingController? controller;
  final String hintText;
  final String label;
  final bool obscureText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: softBoldTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
          ),

          // textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.brightness == Brightness.dark
                ? const Color(0xff1a1d2c)
                : const Color(0xfffafafa),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 20.h,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
              fillColor: whiteSoft,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              suffixIcon: isPasswordField ? suffixIcon : null,
            ),
          ),
        ),
      ],
    );
  }
}
