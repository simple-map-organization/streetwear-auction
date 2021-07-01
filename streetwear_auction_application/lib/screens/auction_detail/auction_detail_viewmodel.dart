import '../../app/auth.dart';
import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../../models/purchase.dart';
import '../../services/auction/auction_service.dart';
import '../../services/purchase/purchase_service.dart';
import '../viewmodel.dart';

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

  Future<void> onPlaceBid(int price, context) async {
    turnBusy();
    auction = await dataService.bidAuction(
        auctionID: auction.auctionId, price: price);
    turnIdle();
  }

  Future<Purchase> getUserPurchaseByAuctionId(String auctionId) {
    var future = purchaseService.getUserPurchaseByAuctionId(auctionId);
    this.update(() => future);
    return future;
  }
}
