import 'package:ecommers_new/providers/search_history_provider.dart';
//import 'package:ecommers_new/screens/components/search_bar.dart';
import 'package:ecommers_new/screens/search/components/history_search_list.dart';
import 'package:ecommers_new/screens/search/components/small_title_widget.dart';
import 'package:ecommers_new/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommers_new/constants.dart';

import 'package:ecommers_new/screens/search/components/popular_search_list.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _spacer = SizedBox(height: getProportionateScreenHeight(20));
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: kSearchBarTag,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                    horizontal: getProportionateScreenWidth(20)),
                child: SearchBar(
                  enabled: true,
                  controller: _controller,
                ),
              ),
            ),
            _spacer,
            SmallTitle('Popular'),
            PopularSearchList(),
            _spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallTitle('History'),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<SearchHistoryProvider>(context, listen: false)
                          .clearHistory();
                    },
                    child: Text(
                      'Clear History',
                      style: TextStyle(color: Color(0xFFBBBBBB)),
                    ),
                  ),
                ),
              ],
            ),
            HistorySearchList(),
          ],
        ),
      ),
    );
  }
}
