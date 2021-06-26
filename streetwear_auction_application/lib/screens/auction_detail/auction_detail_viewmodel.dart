import 'package:streetwear_auction_application/app/auth.dart';
import 'package:streetwear_auction_application/models/auction.dart';
import 'package:streetwear_auction_application/models/purchase.dart';
import 'package:streetwear_auction_application/services/purchase/purchase_service.dart';

import '../../app/dependencies.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class AuctionDetailViewModel extends Viewmodel {
  AuctionDetailViewModel();
  Auction auction;
  AuctionService get dataService => dependency();
  PurchaseService get purchaseService => dependency();
  AuthService get authService => dependency();

  bool isShowALlBids = false;

  bool get isAuctionOwner {
    return this.authService.user.userId == auction.seller.userId;
  }

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

  Future<void> onPlaceBid(int price) async {
    turnBusy();
    auction = await dataService.bidAuction(
        auctionID: auction.auctionId, price: price);
    turnIdle();
  }

  Future<Purchase> getUserPurchaseByAuctionId(String auctionId) {
    return purchaseService.getUserPurchaseByAuctionId(auctionId);
  }
}
