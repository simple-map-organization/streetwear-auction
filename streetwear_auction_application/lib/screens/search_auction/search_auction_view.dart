import 'package:flutter/material.dart';
// import 'package:streetwear_auction_application/screens/filter_auction/filter_auction.dart';

import '../../app/dependencies.dart';
import 'search_auction_viewmodel.dart';
import 'widgets/category_button.dart';
import '../view.dart';
import '../../widgets/auction_grid.dart';

class SearchAuctionScreen extends StatelessWidget {
  static const routeName = '/searchAuction';
  static MaterialPageRoute createRoute(args) => MaterialPageRoute(
      builder: (_) =>
          SearchAuctionScreen(args == null ? null : args['category']));

  final String category;

  SearchAuctionScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<SearchAuctionViewModel>()..init(category),
      builder: (context, viewmodel, _) => Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextFormField(
            initialValue: viewmodel.searchProductName,
            onFieldSubmitted: viewmodel.onSearchProductName,
            style: TextStyle(fontSize: 12.0),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(12.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
              ),
            ),
          ),
          actions: [
            // IconButton(
            //     icon: Icon(
            //       Icons.filter_alt_sharp,
            //       size: 28.0,
            //     ),
            //     onPressed: () async =>
            //         Navigator.of(context).pushNamed(FilterAuction.routeName)),
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 28.0,
                ),
                onPressed: () {})
          ],
        ),
        body: Column(
          children: [
            ConstrainedBox(
              constraints:
                  BoxConstraints.expand(width: double.infinity, height: 50),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        ...viewmodel.categories.map((category) {
                          final index = viewmodel.categories.indexOf(category);
                          return CategoryButton(
                              category,
                              index == viewmodel.selectedCategory,
                              (isSelected) =>
                                  viewmodel.onCategoryChange(index));
                        }).toList()
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: AuctionGrid(
                    onPressStarIcon: viewmodel.onPressStarIcon,
                    auctions: viewmodel.auctions,
                    onCardPressed: viewmodel.onCardPressed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
