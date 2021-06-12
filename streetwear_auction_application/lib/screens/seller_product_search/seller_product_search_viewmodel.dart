import '../../models/auction.dart';
import '../../app/dependencies.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class SearchSellerProductViewModel extends Viewmodel {
  AuctionService get dataService => dependency();

  List<Auction> auctions;
  String searchProductName;
  String sellerId = '60afa472cdec953fc4d5e8ce';
  Map<String, String> queryMap = {};

  Future<void> getList() async {
    queryMap['seller'] = sellerId;
    turnBusy();
    auctions = await dataService.getAuctionList();
    print(auctions);
    turnIdle();
  }

  void onSearchProductName(String productName) async {
    if (productName == searchProductName) return;

    searchProductName = productName;
    queryMap['productName'] = productName;
    turnBusy();
    auctions = await dataService.getAuctionList(queryMap);
    turnIdle();
  }
}
