import '../../app/dependencies.dart';
import '../../models/watchlist.dart';
import '../rest.dart';
import 'watchlist_service.dart';

class WatchlistServiceRest implements WatchlistService {
  final rest = dependency<RestService>();
  Future<Watchlist> getWatchlist() async {
    var jsonResult = await rest.get('watchlist');
    return Watchlist.fromJson(jsonResult);
  }
}
