import '../../models/purchase.dart';

abstract class PurchaseService {
  Future<List<Purchase>> getPurchasedList();
  Future<Purchase> updateStatus(double rating);
}
