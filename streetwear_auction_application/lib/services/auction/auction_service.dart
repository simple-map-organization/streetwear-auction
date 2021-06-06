import '../../models/auction.dart';

abstract class AuctionService {
  Future<List<Auction>> getAuctionList([Map<String, String> filter]);
  Future<List<Auction>> getUserAuctionList({String sellerId});
}
