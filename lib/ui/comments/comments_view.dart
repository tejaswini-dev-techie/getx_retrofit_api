import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_example/core/shared/constants.dart';
import 'package:getx_example/core/shared/route_constants.dart';
import 'package:getx_example/ui/comments/comments_controller.dart';
import 'package:getx_example/ui/widgets/text_format.dart';

class CommentsView extends StatelessWidget {
  final controller = Get.put<CommentsController>(CommentsController());

  CommentsView({super.key});

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
            'Comments',
            style: TextStyle(
              fontFamily: appFontFamily,
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil().setSp(22.0),
              fontWeight: FontWeight.w700,
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
                : _getCommentsListBuilder();
          },
        ),
      ),
    );
  }

  Widget _getCommentsListBuilder() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(16.0),
          vertical: ScreenUtil().setWidth(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.postTitle,
              style: TextStyle(
                fontFamily: appFontFamily,
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(18.0),
                fontWeight: FontWeight.bold,
                color: darkTextColor,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(5.0),
            ),
            ListView.separated(
              itemCount: controller.commentsModelResult!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    /*Navigate to User Details Screen (Named route)*/
                    Get.toNamed(RouteConstants.usersRoute);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(6.0),
                      horizontal: ScreenUtil().setWidth(16.0),
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(
                          color: darkTextColor
                              .withOpacity(0.5), // set border color
                          width: 1.5), // set border width
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ), // set rounded corner radius
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormat(
                          '${controller.commentsModelResult![index].name}',
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil().setSp(15.0),
                          fontWeight: FontWeight.bold,
                          fontColor: darkTextColor,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(2.5),
                        ),
                        TextFormat(
                          '${controller.commentsModelResult![index].body}',
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil().setSp(12.0),
                          fontWeight: FontWeight.w400,
                          fontColor: darkTextColor,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(5.0),
                        ),
                        TextFormat(
                          '- ${controller.commentsModelResult![index].email}',
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil().setSp(12.0),
                          fontWeight: FontWeight.w600,
                          fontColor: darkTextColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: ScreenUtil().setHeight(25.0),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
