import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../view.dart';
import 'watchlist_viewmodel.dart';
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
                  child: viewmodel.busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: viewmodel.auctions.length,
                          itemBuilder: (context, index) => WatchlistProductCard(
                              viewmodel.watchlist, viewmodel.auctions[index], viewmodel.getWatchlist),
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black87,
                      color: Color.fromRGBO(235, 235, 235, 1)),
                  child: viewmodel.busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: viewmodel.winningAuctions.length,
                          itemBuilder: (context, index) => WatchlistProductCard(
                              viewmodel.watchlist,
                              viewmodel.winningAuctions[index], viewmodel.getWatchlist),
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black87,
                      color: Color.fromRGBO(235, 235, 235, 1)),
                  child: viewmodel.busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: viewmodel.losingAuctions.length,
                          itemBuilder: (context, index) => WatchlistProductCard(
                              viewmodel.watchlist,
                              viewmodel.losingAuctions[index], viewmodel.getWatchlist),
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black87,
                      color: Color.fromRGBO(235, 235, 235, 1)),
                  child: viewmodel.busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: viewmodel.watchingAuctions.length,
                          itemBuilder: (context, index) => WatchlistProductCard(
                              viewmodel.watchlist,
                              viewmodel.watchingAuctions[index], viewmodel.getWatchlist),
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
