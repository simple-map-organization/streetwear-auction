import '../../models/auction.dart';
import '../../app/dependencies.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class SearchSellerProductViewModel extends Viewmodel {
  AuctionService get dataService => dependency();

  List<Auction> auctions;
  String searchProductName;

  Map<String, String> queryMap = {};

  Future<void> getList() async {
    turnBusy();
    auctions = await dataService.getAuctionList();
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
