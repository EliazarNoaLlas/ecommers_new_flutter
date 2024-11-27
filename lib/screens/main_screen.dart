import 'package:ecommers_new/providers/UserProvider.dart';
import 'package:ecommers_new/providers/order_provider.dart';
import 'package:ecommers_new/providers/persistent_tab_provider.dart';
import 'package:ecommers_new/screens/account/account_screen.dart';
import 'package:ecommers_new/screens/cart/cart_screen.dart';
import 'package:ecommers_new/screens/category/category_screen.dart';
import 'package:ecommers_new/screens/home/home_screen.dart';
import 'package:ecommers_new/services/google_signin_api.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../size_config.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(
      slug: 'root',
      showAll: false,
    ),
    CartScreen(),
    AccountScreen(),
  ];

  List<PersistentBottomNavBarItem> _navbarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.category),
        title: ("Categories"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        onPressed: (_) {
          // if user is not logged in no need to check if there is an order
          if (context.read<UserProvider>().isLoggedIn) {
            Provider.of<OrderProvider>(context, listen: false).fetchOrder();
          }
          Provider.of<PersistentTabProvider>(context, listen: false)
              .changeTab(2);
        },
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle),
        title: ("Account"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PersistentTabController _controller =
        Provider.of<PersistentTabProvider>(context).controller;
    return Scaffold(
      body: buildPersistentTabView(context, _controller),
    );
  }

  PersistentTabView buildPersistentTabView(
      BuildContext context, PersistentTabController controller) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: _navbarItems(),
      navBarStyle: NavBarStyle.style6,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Color(0xFF8ECAE6),
      ),
    );
  }
}