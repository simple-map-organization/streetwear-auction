import '../../models/auction.dart';

abstract class AuctionService {
  Future<List<Auction>> getAuctionList([Map<String, String> filter]);

  Future<List<Auction>> getUserAuctionList({String sellerId});

  Future<void> updateAuctionStatus({String auctionID, String status});

  Future<Auction> startAuction(
      {String sellerId,
      String productName,
      String productSKU,
      String shortProductName,
      String condition,
      String size,
      String category,
      int bin,
      int startingPrice,
      int minIncrement,
      int deliveryFee,
      DateTime endTime});
}
