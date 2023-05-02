import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/core/shared/constants.dart';
import 'package:getx_example/ui/account/account_view.dart';
import 'package:getx_example/ui/home/home_controller.dart';
import 'package:getx_example/ui/posts/posts_view.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put<HomeController>(HomeController());
  final List<Widget> _children = [PostsView(), AccountView()];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _children.elementAt(controller.selectedIndex.value),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: whiteColor,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onTabTapped,
          selectedItemColor: purpleColor,
          /*Selected Item Color*/
          unselectedItemColor: Colors.black,
          /*Unselected Item Color*/
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.article_outlined,
              ),
              label: 'Posts',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
