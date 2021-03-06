import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../../services/auction/auction_service.dart';
import '../start_auction/start_auction_view.dart';
import '../viewmodel.dart';

class SellerProductViewModel extends Viewmodel {
  List<Auction> auctions = [];

  String searchProductName;

  SellerProductViewModel();
  AuctionService get dataService => dependency();
  Map<String, String> queryMap = {};

  Future<void> getList() async {
    turnBusy();
    auctions = await dataService.getSellerAuctionList();
    turnIdle();
  }

  get ongoingAuctions => auctions.where((i) => i.status == "Ongoing").toList();
  get paymentPendingAuctions =>
      auctions.where((i) => i.status == "Payment Pending").toList();
  get toShipAuctions => auctions.where((i) => i.status == "To Ship").toList();
  get shippedAuctions =>
      auctions.where((i) => i.status == "To Receive").toList();
  get completedAuctions => auctions
      .where((i) => i.status == "Completed" || i.status == "To Rate")
      .toList();
  get cancelledAuctions =>
      auctions.where((i) => i.status.contains('Cancelled')).toList();

  void onSearchProductName(String productName) async {
    if (productName == searchProductName) return;

    searchProductName = productName;
    queryMap['productName'] = productName;
    turnBusy();
    auctions = await dataService.getSellerAuctionList(queryMap);
    turnIdle();
  }

  void onPressFloatButton(context) async {
    var newAuction = (await Navigator.of(context).pushNamed(
      StartAuctionScreen.routeName,
    ));
    if (newAuction != null) {
      auctions.add(newAuction);
    }
    turnIdle();
  }

  Future<void> onPressStatusButton(String auctionID, String status) async {
    turnBusy();
    await dataService.updateAuctionStatus(auctionID: auctionID, status: status);
    auctions
        .where((element) => element.auctionId == auctionID)
        .toList()[0]
        .status = status;
    turnIdle();
  }
}
