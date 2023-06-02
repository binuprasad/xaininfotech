import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/view/product_home.dart';

import '../controller/bottom_navcontroller.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});
  final bottonNavController = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
            index: bottonNavController.tabIndex.value,
            children:  [
              ProductHome(),
              ProductHome(),
              ProductHome(),
              ProductHome(),
            ]),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4,
        child: Obx(
          () => BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            currentIndex: bottonNavController.tabIndex.value,
            onTap: bottonNavController.changeTabIndex,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt),
                  label: "Order"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "Notification"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_comfy_alt),
                  label: "More"),
            ],
          ),
        ),
      ),
    );
  }
}
