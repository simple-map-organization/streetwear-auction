import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/auction.dart';
import 'package:streetwear_auction_application/models/watchlist.dart';
import 'package:streetwear_auction_application/screens/viewmodel.dart';
import 'package:streetwear_auction_application/services/watchlist/watchlist_service.dart';

class WatchlistViewModel extends Viewmodel {
  List<Auction> auctions;
  Watchlist watchlist;
  WatchlistViewModel();
  WatchlistService get dataService => dependency();

  Future<void> getWatchlist() async {
    turnBusy();
    watchlist = await dataService.getWatchlist();
    auctions = watchlist.auctions;
    turnIdle();
  }

  get winningAuctions => auctions
      .where((i) => (i.bids[0]["userId"] == watchlist.user.userId))
      .toList();

  get losingAuctions => auctions
      .where((i) =>
          (i.bids[0]["userId"] != watchlist.user.userId) &&
          (i.bids.contains((bid) => bid["userId"] == watchlist.user.userId)))
      .toList();

  get watchingAuctions => auctions
      .where((i) =>
          (i.bids.contains((bid) => bid["userId"] = watchlist.user.userId)))
      .toList();
}
