import '../../app/dependencies.dart';
import '../../models/purchase.dart';
import '../../services/purchase/purchase_service.dart';

// import '../../app/dependencies.dart';
import '../viewmodel.dart';

class PurchaseViewModel extends Viewmodel {
  String dropdownValue = 'All';
  var selection = [
    'All',
    'To Pay',
    'To Ship',
    'To Receive',
    'To Rate',
    'Completed',
    'Cancelled'
  ];
  List<Purchase> purchaseList;
  List<Purchase> disaplayWinPurchaseList;
  PurchaseService get purchaseService => dependency();
  double sellerRating;

  get winPurchaseList => purchaseList.where((e) => e.won).toList();
  get lostPurchaseList => purchaseList.where((e) => !e.won).toList();
  get toPayPurchaseList => purchaseList
      .where((e) => e.won && e.product.status == 'Payment Pending')
      .toList();
  get toRatePurchaseList => purchaseList
      .where((e) => e.won && e.product.status == 'To Rate')
      .toList();
  get toShipPurchaseList => purchaseList
      .where((e) => e.won && e.product.status == 'To Ship')
      .toList();
  get toReceievePurchaseList => purchaseList
      .where((e) => e.won && e.product.status == 'To Receieve')
      .toList();
   get completedPurchaseList => purchaseList
      .where((e) => e.won && e.product.status == 'Completed')
      .toList();
   get cancelledPurchaseList => purchaseList
      .where((e) => e.won && e.product.status.contains('Cancelled'))
      .toList();

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
      case 'Cancelled':
        disaplayWinPurchaseList = cancelledPurchaseList;
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
        .product
        .status = result.product.status;
    turnIdle();
  }
}
