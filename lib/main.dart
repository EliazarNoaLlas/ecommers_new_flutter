import 'package:ecommers_new/providers/carousel_provider.dart';
import 'package:ecommers_new/providers/order_provider.dart';
import 'package:ecommers_new/providers/persistent_tab_provider.dart';
import 'package:ecommers_new/providers/product/trend_product_provider.dart';
import 'package:ecommers_new/providers/UserProvider.dart';
import 'package:ecommers_new/providers/search_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommers_new/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PersistentTabProvider()),
        ChangeNotifierProvider(create: (_) => TrendProductProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => SearchHistoryProvider()),
        ChangeNotifierProvider(create: (_) => CarouselProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
