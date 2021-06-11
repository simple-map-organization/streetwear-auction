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

  Future<void> updateAuctionStatus({String auctionID, String status}) async {
    await rest.put('auction/$auctionID?', data: {'status': status});
  }

  Future<Auction> startAuction(
      {String sellerId,
      String productName,
      String productSKU,
      String shortProductName,
      String condition,
      String size,
      String category}) async {
    final json = await rest.post('auction/', data: {
      'seller': sellerId,
      'productName': productName,
      'productSKU': productSKU,
      'shortProductName': shortProductName,
      'condition': condition,
      'size': size,
      // 'status': 'ongoing',
      // 'endTime': DateTime.now().toIso8601String(),
      'category': category
    });
    return Auction.fromJson(json);
  }
}
