import 'package:ecommers_new/providers/product/trend_product_provider.dart';
import 'package:ecommers_new/screens/components/product_card.dart';
import 'package:ecommers_new/screens/home/components/section_title.dart';
import 'package:ecommers_new/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendProducts extends StatefulWidget {
  @override
  _TrendProductsState createState() => _TrendProductsState();
}

class _TrendProductsState extends State<TrendProducts> {
  @override
  void initState() {
    super.initState();
    // this part calls provider just 1 time without exception
    // and add the Product data to product list
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<TrendProductProvider>(context, listen: false)
          .fetchTrendProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: 'Trending', press: () {}),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: Provider.of<TrendProductProvider>(context)
                .productList
                .map(
                  (product) => ProductCard(
                    product: product,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
