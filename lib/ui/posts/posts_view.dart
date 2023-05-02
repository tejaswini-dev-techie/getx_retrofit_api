import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_example/ui/comments/comments_view.dart';
import 'package:getx_example/ui/posts/posts_controller.dart';
import 'package:getx_example/core/shared/constants.dart';
import 'package:getx_example/ui/widgets/text_format.dart';

class PostsView extends StatelessWidget {
  final controller = Get.put<PostsController>(PostsController());

  PostsView({super.key});

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
            'Posts',
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
                : _getPostListBuilder();
          },
        ),
      ),
    );
  }

  Widget _getPostListBuilder() {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(16.0),
        right: ScreenUtil().setWidth(16.0),
        top: ScreenUtil().setWidth(10.0),
      ),
      child: ListView.separated(
        itemCount: controller.postModelResponse!.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormat(
                '${controller.postModelResponse![index].title}',
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(15.0),
                fontWeight: FontWeight.bold,
                fontColor: darkTextColor,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(2.5),
              ),
              TextFormat(
                '${controller.postModelResponse![index].body}',
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(12.0),
                fontWeight: FontWeight.w400,
                fontColor: darkTextColor,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(6.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormat(
                    'ID - ${controller.postModelResponse![index].id}',
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil().setSp(12.0),
                    fontWeight: FontWeight.w400,
                    fontColor: darkTextColor,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => CommentsView(),
                        arguments: [
                          '${controller.postModelResponse![index].title}',
                          '${controller.postModelResponse![index].userId}'
                        ],
                      );
                    },
                    child: Icon(
                      Icons.comment_outlined,
                      color: Colors.black,
                      size: ScreenUtil().setWidth(18.0),
                    ),
                  ),
                ],
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
