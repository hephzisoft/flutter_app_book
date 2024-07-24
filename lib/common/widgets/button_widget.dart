import 'package:app_book/common/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class ButtonWidgetWithIcon extends StatelessWidget {
  const ButtonWidgetWithIcon({
    super.key,
    required this.icon,
    this.text = 'NEXT',
    this.backgroundColor = primaryColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.verticalPadding = 5,
    this.horizontalPadding = 12,
    this.fontSize = 16,
    this.side = const BorderSide(),
    this.fontWeight = FontWeight.normal,
  });

  final Widget icon;
  final BorderSide side;
  final String text;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: side,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding.w,
          vertical: verticalPadding.h,
        ),
      ),
      onPressed: onPressed,
      icon: icon,
      label: Text(
        text,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.text = 'NEXT',
    this.backgroundColor = primaryColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.verticalPadding = 5,
    this.borderRadius = 10,
    this.horizontalPadding = 12,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double verticalPadding;
  final double horizontalPadding;
  final double borderRadius;
  final FontWeight fontWeight;
  final double fontSize;

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding.w,
          vertical: verticalPadding.h,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
