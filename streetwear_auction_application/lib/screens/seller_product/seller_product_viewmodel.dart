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
    auctions = await dataService.getUserAuctionList(
        sellerId: '60afa472cdec953fc4d5e8ce');
    turnIdle();
  }
}
