import '../../models/purchase.dart';

abstract class PurchaseService {
  Future<List<Purchase>> getPurchasedList();
  Future<Purchase> getUserPurchaseByAuctionId(String auctionId);
  Future<Purchase> getUserPurchaseByUserIdAndAuctionId(
      String auctionId, String userId);
  Future<Purchase> updateStatus(String purchaseId, double rating);
  Future<void> updatePurchase(
    String purchaseId, {
    String fullname,
    String phone,
    String address1,
    String address2,
    String state,
    String postcode,
  });
}
