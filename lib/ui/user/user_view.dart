import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_example/core/shared/constants.dart';
import 'package:getx_example/ui/user/user_controller.dart';

class UsersView extends StatelessWidget {
  final controller = Get.put<UserController>(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: whiteColor,
          titleSpacing: 0.0,
          centerTitle: false,
          title: Text(
            'User Details',
            style: TextStyle(
              fontFamily: appFontFamily,
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil().setSp(45.0),
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
        left: ScreenUtil().setWidth(30.0),
        right: ScreenUtil().setWidth(30.0),
        top: ScreenUtil().setWidth(25.0),
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
                  fontSize: ScreenUtil().setSp(40.0),
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Username: ',
                  style: TextStyle(
                    color: darkTextColor,
                    fontSize: ScreenUtil().setSp(30),
                    fontFamily: appFontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.userDetailsResult![index].username}',
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.w400,
                        color: darkTextColor,
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
                    fontSize: ScreenUtil().setSp(30),
                    fontFamily: appFontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.userDetailsResult![index].email}',
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(30.0),
                        fontWeight: FontWeight.w400,
                        color: darkTextColor,
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
                    fontSize: ScreenUtil().setSp(30.0),
                    fontFamily: appFontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '${controller.userDetailsResult![index].address?.city}',
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(30.0),
                        fontWeight: FontWeight.w400,
                        color: darkTextColor,
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
                    fontSize: ScreenUtil().setSp(30.0),
                    fontFamily: appFontFamily,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.userDetailsResult![index].website}',
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(30.0),
                        fontWeight: FontWeight.w400,
                        color: darkTextColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: ScreenUtil().setHeight(20.0),
          );
        },
      ),
    );
  }
}
