import '../../models/auction.dart';
import '../../app/dependencies.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class SearchAuctionViewModel extends Viewmodel {
  //const here
  List<String> categories = const [
    'All',
    'Sneaker',
    'Cap',
    'Shirt',
    'Pants',
    'Cardholder'
  ];

  AuctionService get dataService => dependency();

  //states here
  List<Auction> auctions;
  String searchProductName;
  int selectedCategory = 0;

  Map<String, String> queryMap = {};

  void init(category) async {
    if (category == null) return getList();
    selectedCategory =
        categories.indexWhere((_category) => _category == category);

    queryMap['category'] = categories[selectedCategory];
    turnBusy();
    auctions = await dataService.getAuctionList(queryMap);
    turnIdle();
  }

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

  void onCategoryChange(int index) async {
    if (index == selectedCategory) return;

    selectedCategory = index;
    queryMap['category'] = categories[index];
    if ((index == 0)) queryMap['category'] = '';
    turnBusy();
    auctions = await dataService.getAuctionList(queryMap);
    turnIdle();
  }
}
