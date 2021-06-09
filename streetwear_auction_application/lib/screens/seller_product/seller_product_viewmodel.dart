import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/seller_product_search/seller_product_search_view.dart';
import '../../app/dependencies.dart';
import 'seller_product_view.dart';
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
  Map<String, String> userMap = {};
  Map<String, String> statusMap = {};

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

  void onPressStatusButton(context, String auctionID, String status) {
    turnBusy();
    dataService.updateAuctionStatus(auctionID: auctionID, status: status);
    turnIdle();
    Navigator.of(context).pop();
    Navigator.pushNamed(context, SellerProductScreen.routeName);
  }
}