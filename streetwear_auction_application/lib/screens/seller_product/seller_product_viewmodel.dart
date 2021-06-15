import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/seller_product_search/seller_product_search_view.dart';
import 'package:streetwear_auction_application/screens/start_auction/start_auction_view.dart';
import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class SellerProductViewModel extends Viewmodel {
  List<Auction> auctions;

  SellerProductViewModel();
  AuctionService get dataService => dependency();

  Future<void> getList() async {
    turnBusy();
    auctions = await dataService.getSellerAuctionList();
    turnIdle();
  }

  get ongoingAuctions => auctions.where((i) => i.status == "ongoing").toList();
  get paymentPendingAuctions =>
      auctions.where((i) => i.status == "payment pending").toList();
  get toShipAuctions => auctions.where((i) => i.status == "to ship").toList();
  get shippedAuctions => auctions.where((i) => i.status == "shipped").toList();

  void onPressSearchBar(context) {
    Navigator.of(context).pushNamed(
      SearchSellerProductScreen.routeName,
    );
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
