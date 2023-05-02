import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_example/core/shared/constants.dart';
import 'package:getx_example/core/shared/route_constants.dart';
import 'package:getx_example/services/api_services.dart';
import 'package:getx_example/ui/account/account_binding.dart';
import 'package:getx_example/ui/account/account_view.dart';
import 'package:getx_example/ui/comments/comments_bindings.dart';
import 'package:getx_example/ui/comments/comments_view.dart';
import 'package:getx_example/ui/home/home_bindings.dart';
import 'package:getx_example/ui/home/home_view.dart';
import 'package:getx_example/ui/posts/posts_bindings.dart';
import 'package:getx_example/ui/posts/posts_view.dart';
import 'package:getx_example/ui/splashScreen/splash_bindings.dart';
import 'package:getx_example/ui/splashScreen/splash_view.dart';
import 'package:getx_example/ui/user/user_binding.dart';
import 'package:getx_example/ui/user/user_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    /*Device Orientation*/
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    /*Screen Util - adapts according to screen size*/
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // designSize: const Size(720, 1280),
      // allowFontScaling: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Get Retro App',
        debugShowCheckedModeBanner: false,
        initialBinding: InitBinding(),
        initialRoute: "/",
        theme: lightTheme,
        getPages: [
          GetPage(
            name: RouteConstants.splashRoute,
            page: () => const SplashView(),
            binding: SplashBinding(),
          ),
          GetPage(
            name: RouteConstants.homeRoute,
            page: () => HomeView(),
            binding: HomeBinding(),
          ),
          GetPage(
            name: RouteConstants.postsRoute,
            page: () => PostsView(),
            binding: PostsBinding(),
          ),
          GetPage(
            name: RouteConstants.commentsRoute,
            page: () => CommentsView(),
            binding: CommentsBinding(),
          ),
          GetPage(
            name: RouteConstants.usersRoute,
            page: () => UsersView(),
            binding: UserBinding(),
          ),
          GetPage(
            name: RouteConstants.accountRoute,
            page: () => AccountView(),
            binding: AccountBinding(),
          ),
        ],
      ),
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Inject service for Global
    Get.put(APIServices());
  }
}
