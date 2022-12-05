import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../controllers/products_list_controller.dart';
import '../components/nevigation_bar_icon.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  final ProductListController productListController =
      Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        HomeScreen(),
        CartScreen(),
        FavoriteScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        navigationBarIcon(icon: Icons.home),
        navigationBarIcon(icon: Icons.shopping_cart),
        navigationBarIcon(icon: Icons.favorite_outlined),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: buildScreens(),
      items: navBarsItems(),
      navBarStyle: NavBarStyle.style10,
      navBarHeight: MediaQuery.of(context).size.height * 0.09,
    );
  }
}
