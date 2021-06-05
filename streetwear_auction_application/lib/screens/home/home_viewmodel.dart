import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../viewmodel.dart';
import '../../services/auction/auction_service.dart';

class HomeViewModel extends Viewmodel {
  List<Auction> auctions;

  HomeViewModel();
  AuctionService get dataService => dependency();

  Future<void> getList() async {
    turnBusy();
    auctions = await dataService.getAuctionList();
    turnIdle();
  }
}
