import '../../models/auction.dart';
import '../../models/watchlist.dart';

abstract class WatchlistService {
  Future<Watchlist> getWatchlist();
}
