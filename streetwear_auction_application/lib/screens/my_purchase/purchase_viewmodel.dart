import '../../app/dependencies.dart';
import '../../models/purchase.dart';
import '../../services/purchase/purchase_service.dart';

// import '../../app/dependencies.dart';
import '../viewmodel.dart';

class PurchaseViewModel extends Viewmodel {
  String dropdownValue = 'All';
  var selection = [
    'All',
    'Completed',
    'To Pay',
    'To Ship',
    'To Receive',
    'To Rate'
  ];
  List<Purchase> purchaseList;
  List<Purchase> disaplayWinPurchaseList;
  PurchaseService get purchaseService => dependency();
  double sellerRating;

  get winPurchaseList => purchaseList.where((e) => e.won).toList();
  get lostPurchaseList => purchaseList.where((e) => !e.won).toList();
  get toPayPurchaseList =>
      purchaseList.where((e) => e.won && e.status == 'To Pay').toList();
  get completedPurchaseList =>
      purchaseList.where((e) => e.won && e.status == 'Completed').toList();
  get toRatePurchaseList =>
      purchaseList.where((e) => e.won && e.status == 'To Rate').toList();
  get toShipPurchaseList =>
      purchaseList.where((e) => e.won && e.status == 'To Ship').toList();
  get toReceievePurchaseList =>
      purchaseList.where((e) => e.won && e.status == 'To Receieve').toList();

  PurchaseViewModel();

  Future<void> getPurchasedList() async {
    turnBusy();
    purchaseList = await purchaseService.getPurchasedList();
    disaplayWinPurchaseList = winPurchaseList;
    turnIdle();
  }

  void setValue(String newValue) {
    turnBusy();
    dropdownValue = newValue;
    switch (dropdownValue) {
      case 'All':
        disaplayWinPurchaseList = winPurchaseList;
        break;
      case 'Completed':
        disaplayWinPurchaseList = completedPurchaseList;
        break;
      case 'To Pay':
        disaplayWinPurchaseList = toPayPurchaseList;
        break;
      case 'To Ship':
        disaplayWinPurchaseList = toShipPurchaseList;
        break;
      case 'To Receive':
        disaplayWinPurchaseList = toReceievePurchaseList;
        break;
      case 'To Rate':
        disaplayWinPurchaseList = toRatePurchaseList;
        break;
    }
    turnIdle();
  }

  void setRating(double rating) {
    sellerRating = rating;
  }

  void updateStatus({Purchase purchase, double rating = -1}) async {
    turnBusy();
    Purchase result =
        await purchaseService.updateStatus(purchase.purchaseId, rating);
    purchaseList
        .where((element) => element.purchaseId == purchase.purchaseId)
        .toList()[0]
        .status = result.status;
    turnIdle();
  }
}
