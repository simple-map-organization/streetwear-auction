import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/seller_product_search/seller_product_search_view.dart';
import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class SellerProductViewModel extends Viewmodel {
  List<Auction> auctions;
  List<Auction> shippedAuctions;
  List<Auction> ongoingAuctions;
  List<Auction> paymentPendingAuctions;
  List<Auction> toShipAuctions;
  String sellerId = '60afa472cdec953fc4d5e8ce';
  Map<String, String> queryMap = {};

  SellerProductViewModel();
  AuctionService get dataService => dependency();

  Future<void> getList() async {
    queryMap['seller'] = sellerId;

    turnBusy();
    auctions = await dataService.getAuctionList(queryMap);
    ongoingAuctions = auctions.where((i) => i.status == "ongoing").toList();
    paymentPendingAuctions =
        auctions.where((i) => i.status == "payment pending").toList();
    toShipAuctions = auctions.where((i) => i.status == "to ship").toList();
    shippedAuctions = auctions.where((i) => i.status == "shipped").toList();
    turnIdle();
  }

  void onPressSearchBar(context) {
    Navigator.of(context).pushNamed(
      SearchSellerProductScreen.routeName,
    );
  }

  void onPressFloatButton(context) {
    Navigator.of(context).pushNamed(
      SearchSellerProductScreen.routeName,
    );
  }

  Future<void> onPressStatusButton(String auctionID, String status) async {
    turnBusy();
    await dataService.updateAuctionStatus(auctionID: auctionID, status: status);
    auctions
        .where((element) => element.auctionId == auctionID)
        .toList()[0]
        .status = status;
    ongoingAuctions = auctions.where((i) => i.status == "ongoing").toList();
    paymentPendingAuctions =
        auctions.where((i) => i.status == "payment pending").toList();
    toShipAuctions = auctions.where((i) => i.status == "to ship").toList();
    shippedAuctions = auctions.where((i) => i.status == "shipped").toList();
    turnIdle();
  }
}
