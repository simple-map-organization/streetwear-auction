import '../../models/purchase.dart';

abstract class PurchaseService {
  Future<List<Purchase>> getPurchasedList();
  Future<Purchase> updateStatus(String purchaseId, double rating);
}
