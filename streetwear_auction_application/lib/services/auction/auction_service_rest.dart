import 'package:streetwear_auction_application/services/auction/auction_service.dart';

import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../rest.dart';

class AuctionServiceRest implements AuctionService {
  final rest = dependency<RestService>();

  Future<List<Auction>> getAuctionList([Map<String, String> filter]) async {
    String endPoint = filter == null
        ? 'auction'
        : 'auction?' + Uri(queryParameters: filter).query;

    var jsonList = await rest.get(endPoint);

    List<Auction> auctionList =
        (jsonList as List).map((json) => Auction.fromJson(json)).toList();

    return auctionList;
  }

  Future<List<Auction>> getUserAuctionList({String sellerId}) async {
    var jsonList = await rest.get('auction/seller/$sellerId');

    List<Auction> auctionList =
        (jsonList as List).map((json) => Auction.fromJson(json)).toList();

    return auctionList;
  }
}
