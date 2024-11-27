import 'package:ecommers_new/providers/UserProvider.dart';
import 'package:ecommers_new/providers/carousel_provider.dart';
import 'package:ecommers_new/providers/product/trend_product_provider.dart';
//import 'package:ecommers_new/screens/components/search_bar.dart';
import 'package:ecommers_new/screens/home/components/home_carousel.dart';
import 'package:ecommers_new/screens/home/components/trend_products.dart';
import 'package:ecommers_new/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:ecommers_new/constants.dart';

import 'package:ecommers_new/size_config.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static TextEditingController _controller = TextEditingController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // check if user is logged in or not
    Provider.of<UserProvider>(context, listen: false).checkIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    var _spacer = SizedBox(height: getProportionateScreenHeight(20.0));

    Future<Null> _refresh() async {
      await Provider.of<CarouselProvider>(context, listen: false)
          .fetchImageURLs();
      await Provider.of<TrendProductProvider>(context, listen: false)
          .fetchTrendProducts();
    }

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                forceElevated: innerBoxIsScrolled,
                floating: true,
                title: Center(
                  child: Text(
                    'Emre\'s E-Commerce',
                    style: TextStyle(
                      color: Color(0xFF8ECAE6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
              )
            ];
          },
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: kSearchBarTag,
                child: GestureDetector(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: SearchScreen(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.slideUp);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(10)),
                    child: SearchBar(enabled: false, controller: _controller),
                  ),
                ),
              ),
              Flexible(
                child: RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: _refresh,
                  child: ListView(
                    children: [
                      _spacer,
                      HomeCarousel(),
                      _spacer,
                      TrendProducts(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
