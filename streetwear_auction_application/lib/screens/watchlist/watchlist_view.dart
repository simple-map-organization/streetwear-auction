import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/view.dart';
import 'package:streetwear_auction_application/screens/watchlist/watchlist_viewmodel.dart';

import 'widgets/watchlist_product_card.dart';

class WatchListScreen extends StatelessWidget {
  static const routeName = '/watchlist';
  static Route<dynamic> createRoute() =>
      MaterialPageRoute(builder: (_) => WatchListScreen());

  const WatchListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<WatchlistViewModel>()..getWatchlist(),
      builder: (context, viewmodel, _) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            // title: TextFormField(
            //   style: TextStyle(fontSize: 12.0),
            //   cursorColor: Colors.grey,
            //   decoration: InputDecoration(
            //     hintText: 'Search here',
            //     isDense: true,
            //     contentPadding: EdgeInsets.all(12.0),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
            //     ),
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
            //     ),
            //   ),
            // ),
            toolbarHeight: 50,
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: 4.0, color: Theme.of(context).primaryColor),
              ),
              tabs: [
                Tab(
                    child: Text('All',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Tab(
                    child: Text('Winning',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Tab(
                    child: Text('Losing',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Tab(
                    child: Text('Watching',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
              ],
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: TabBarView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black87,
                      color: Color.fromRGBO(235, 235, 235, 1)),
                  child: ListView.builder(
                    itemCount: viewmodel.auctions.length,
                    itemBuilder: (context, index) => WatchlistProductCard(
                        viewmodel.watchlist,
                        viewmodel.auctions[index]),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black87,
                      color: Color.fromRGBO(235, 235, 235, 1)),
                  child: ListView.builder(
                    itemCount: viewmodel.winningAuctions.length,
                    itemBuilder: (context, index) => WatchlistProductCard(
                        viewmodel.watchlist,
                        viewmodel.winningAuctions[index]),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black87,
                      color: Color.fromRGBO(235, 235, 235, 1)),
                  child: ListView.builder(
                    itemCount: viewmodel.losingAuctions.length,
                    itemBuilder: (context, index) => WatchlistProductCard(
                        viewmodel.watchlist,
                        viewmodel.losingAuctions[index]),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black87,
                      color: Color.fromRGBO(235, 235, 235, 1)),
                  child: ListView.builder(
                    itemCount: viewmodel.watchingAuctions.length,
                    itemBuilder: (context, index) => WatchlistProductCard(
                        viewmodel.watchlist,
                        viewmodel.watchingAuctions[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
