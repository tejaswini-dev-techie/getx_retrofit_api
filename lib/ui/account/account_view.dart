import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_example/core/shared/constants.dart';
import 'package:getx_example/ui/account/account_controller.dart';

class AccountView extends StatelessWidget {
  final controller = Get.put<AccountController>(AccountController());

  AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: whiteColor,
          centerTitle: true,
          title: Text(
            'Account',
            style: TextStyle(
              fontFamily: appFontFamily,
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil().setSp(22.0),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: Center(
        child: Obx(
          () {
            return controller.isDone.isFalse
                ? Center(
                    child: CircularProgressIndicator(
                      color: purpleColor,
                    ),
                  )
                : _getUserListBuilder();
          },
        ),
      ),
    );
  }

  Widget _getUserListBuilder() {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(16.0),
        right: ScreenUtil().setWidth(16.0),
        top: ScreenUtil().setWidth(10.0),
      ),
      child: ListView.separated(
        itemCount: controller.userDetailsResult!.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${controller.userDetailsResult![index].name}',
                style: TextStyle(
                  fontFamily: appFontFamily,
                  fontStyle: FontStyle.normal,
                  fontSize: ScreenUtil().setSp(18.0),
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                  height: ScreenUtil().setHeight(1.5),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Username: ',
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: ScreenUtil().setSp(15),
                    fontFamily: appFontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    height: ScreenUtil().setHeight(1.5),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.userDetailsResult![index].username}',
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.w700,
                        color: darkTextColor,
                        height: ScreenUtil().setHeight(1.5),
                      ),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Email: ',
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: ScreenUtil().setSp(12),
                    fontFamily: appFontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    height: ScreenUtil().setHeight(1.5),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.userDetailsResult![index].email}',
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(12.0),
                        fontWeight: FontWeight.w700,
                        color: darkTextColor,
                        height: ScreenUtil().setHeight(1.5),
                      ),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'City: ',
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: ScreenUtil().setSp(12.0),
                    fontFamily: appFontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    height: ScreenUtil().setHeight(1.5),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '${controller.userDetailsResult![index].address?.city}',
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(12.0),
                        fontWeight: FontWeight.w700,
                        color: darkTextColor,
                        height: ScreenUtil().setHeight(1.5),
                      ),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Website: ',
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: ScreenUtil().setSp(12.0),
                    fontFamily: appFontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    height: ScreenUtil().setHeight(1.5),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.userDetailsResult![index].website}',
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(12.0),
                        fontWeight: FontWeight.w700,
                        color: darkTextColor,
                        height: ScreenUtil().setHeight(1.5),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: darkTextColor,
          );
        },
      ),
    );
  }
}
