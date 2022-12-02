import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

navigationBarIcon({required IconData icon}) {
  return PersistentBottomNavBarItem(
    icon: Icon(icon),
    activeColorSecondary: Colors.white,
    activeColorPrimary: Colors.green,
    inactiveColorPrimary: Colors.grey,
  );
}
