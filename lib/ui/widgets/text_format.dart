import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_example/core/shared/constants.dart';

class TextFormat extends StatelessWidget {
  final String? value;
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final int? maxLine;

  const TextFormat(
    this.value, {
    super.key,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.fontStyle,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value ?? "",
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: fontColor,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily,
        fontSize: fontSize ?? ScreenUtil().setSp(38),
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
