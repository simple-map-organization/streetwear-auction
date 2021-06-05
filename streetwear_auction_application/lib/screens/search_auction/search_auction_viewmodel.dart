import '../../models/auction.dart';
import '../../app/dependencies.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class SearchAuctionViewModel extends Viewmodel {
  //const here
  List<String> categories = const ['All', 'Sneaker', 'Shirt'];

  AuctionService get dataService => dependency();

  //states here
  List<Auction> auctions;
  String searchProductName;
  int selectedCategory;

  Map<String, String> queryMap = {};

  Future<void> getList() async {
    turnBusy();
    auctions = await dataService.getAuctionList();
    turnIdle();
  }

  void onSearchProductName(String productName) async {
    if (productName == searchProductName) return;
    turnBusy();
    searchProductName = productName;
    queryMap['productName'] = productName;
    auctions = await dataService.getAuctionList(queryMap);
    turnIdle();
  }

  void onCategoryChange(int index) async {
    if (index == selectedCategory) return;
    turnBusy();
    selectedCategory = index;
    queryMap['category'] = categories[index];
    if ((index == 0)) queryMap['category'] = '';
    auctions = await dataService.getAuctionList(queryMap);
    turnIdle();
  }
}
