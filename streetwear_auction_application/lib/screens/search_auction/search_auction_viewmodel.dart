import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../../services/auction/auction_service.dart';
import '../auction_detail/auction_detail.dart';
import '../viewmodel.dart';

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
    auctions = await dataService.getAuctionList(queryMap);
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

  void onCardPressed(context, auction) async {
    await Navigator.of(context).pushNamed(AuctionDetailScreen.routeName,
        arguments: {'auction': auction});
    getList();
  }

    Future<String> onPressStarIcon(String auctionID) async {
    String status = await dataService.addAuctionToWatchlist(auctionID: auctionID);
    turnIdle();
    return status;
  }
  
}
