import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_example/core/shared/constants.dart';
import 'package:getx_example/ui/widgets/text_format.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
        child: TextFormat(
          "Welcome",
          fontSize: ScreenUtil().setSp(42),
          fontWeight: FontWeight.w700,
          fontColor: whiteColor,
        ),
      ),
    );
  }
}
