import '../../models/purchase.dart';

abstract class PurchaseService {
  Future<List<Purchase>> getPurchasedList();
  Future<Purchase> getUserPurchaseByAuctionId(String auctionId);
  Future<Purchase> updateStatus(String purchaseId, double rating);
  Future<void> updatePurchase(
    String purchaseId, {
    String fullname,
    String phone,
    String address1,
    String address2,
    String state,
    String status,
    String postcode,
  });
}
