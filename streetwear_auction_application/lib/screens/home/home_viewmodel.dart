import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/auction_detail/auction_detail.dart';
import 'package:streetwear_auction_application/services/notification/notification_service.dart';


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
  NotificationService get notificationService => dependency();
  String notificationCount;

  Future<void> getList() async {
    turnBusy();
    auctions = await dataService.getAuctionList();
    await getNotificationCount();
    turnIdle();
  }

  void getNotificationCount() async {
    notificationCount = await notificationService
        .getNotificationCount()
        .then((value) => notificationCount = value);
    // print(notificationCount);
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
