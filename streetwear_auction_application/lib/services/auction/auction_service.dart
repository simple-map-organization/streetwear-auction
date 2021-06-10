import '../../models/auction.dart';

abstract class AuctionService {
  Future<List<Auction>> getAuctionList([Map<String, String> filter]);

  Future<List<Auction>> getUserAuctionList({String sellerId});

  void updateAuctionStatus({String auctionID, String status});

  void startAuction({String sellerId,
      String productName,
      String productSKU,
      String shortProductName,
      String condition,
      String size});
}
