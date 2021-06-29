import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../../services/auction/auction_service.dart';
import '../auction_detail/auction_detail.dart';
import '../search_auction/search_auction_view.dart';
import '../viewmodel.dart';

class HomeViewModel extends Viewmodel {
  List<Auction> auctions;
  HomeViewModel();
  AuctionService get dataService => dependency();

  Future<void> getList() async {
    turnBusy();
    auctions = await dataService.getAuctionList();
    turnIdle();
  }

  void onPressSearchBar(context) async {
    await Navigator.of(context).pushNamed(
      SearchAuctionScreen.routeName,
    );
    getList();
  }

  void onCardPressed(context, auction) async {
    await Navigator.of(context).pushNamed(AuctionDetailScreen.routeName,
        arguments: {'auction': auction});
    getList();
  }

  Future<String> onPressStarIcon(String auctionID) async {
    String status =
        await dataService.addAuctionToWatchlist(auctionID: auctionID);
    turnIdle();
    return status;
  }
}
