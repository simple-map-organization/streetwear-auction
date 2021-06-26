import 'package:flutter/material.dart';

import '../search_auction/search_auction_view.dart';
import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class HomeViewModel extends Viewmodel {
  List<Auction> auctions;
  String status;
  HomeViewModel();
  AuctionService get dataService => dependency();

  Future<void> getList() async {
    turnBusy();
    auctions = await dataService.getAuctionList();
    turnIdle();
  }

  void onSelectCategory(context, category) {
    Navigator.of(context).pushNamed(SearchAuctionScreen.routeName,
        arguments: {'category': category});
  }

  void onPressSearchBar(context) {
    Navigator.of(context).pushNamed(
      SearchAuctionScreen.routeName,
    );
  }

  Future<String> onPressStarIcon(String auctionID) async {
    status = await dataService.addAuctionToWatchlist(auctionID: auctionID);
    turnIdle();
    return status;
  }
}
