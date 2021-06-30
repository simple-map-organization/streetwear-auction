import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../../models/watchlist.dart';
import '../../services/watchlist/watchlist_service.dart';
import '../viewmodel.dart';

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
      .where((auction) =>
          auction.bids.length > 0 &&
          auction.bids.any((bid) => bid.user.userId == watchlist.user.userId) &&
          auction.bids[0].user.userId == watchlist.user.userId)
      .toList();

  get losingAuctions => auctions
      .where((auction) =>
          auction.bids.length > 0 &&
          auction.bids.any((bid) => bid.user.userId == watchlist.user.userId) &&
          auction.bids[0].user.userId != watchlist.user.userId)
      .toList();

  get watchingAuctions => auctions
      .where((auction) =>
          auction.bids.length == 0 ||
          !auction.bids.any((bid) => bid.user.userId == watchlist.user.userId))
      .toList();
}
