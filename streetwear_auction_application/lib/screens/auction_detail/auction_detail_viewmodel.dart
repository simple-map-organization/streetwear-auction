import 'dart:developer';

import 'package:streetwear_auction_application/models/auction.dart';

import '../../app/dependencies.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class AuctionDetailViewModel extends Viewmodel {
  AuctionDetailViewModel();
  Auction auction;
  AuctionService get dataService => dependency();

  bool isShowALlBids = false;

  List<Bid> get bids {
    return !isShowALlBids ? auction.bids.take(3).toList() : auction.bids;
  }

  bool get hasMoreBid {
    return auction.bids.length > 3;
  }

  toggleShowBid() {
    isShowALlBids = !isShowALlBids;
    turnIdle();
  }

  void init(Auction auction) {
    this.auction = auction;
  }

  Future<void> onPlaceBid(String auctionId, int price) async {
    turnBusy();
    auction = await dataService.bidAuction(auctionID: auctionId, price: price);
    turnIdle();
  }
}
