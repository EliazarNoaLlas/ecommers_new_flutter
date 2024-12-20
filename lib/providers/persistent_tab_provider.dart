import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

//This class is used for changing the current tab
class PersistentTabProvider with ChangeNotifier {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  bool isVisibleAppBarBool = true;

  void changeTab(int value) {
    _controller.jumpToTab(value);
    notifyListeners();
  }

  void isVisibleAppBar(index) {
    if (index == 0 || index == 1) {
      isVisibleAppBarBool = true;
    } else {
      isVisibleAppBarBool = false;
    }
    notifyListeners();
  }

  PersistentTabController get controller => _controller;
}
