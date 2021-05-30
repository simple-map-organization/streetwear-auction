import 'package:streetwear_auction_application/services/auction/auction_service.dart';

import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../rest.dart';

class AuctionServiceRest implements AuctionService {
  RestService get rest => dependency();
  Future<List<Auction>> getAuctionList() async {
    return null;
  }
}
