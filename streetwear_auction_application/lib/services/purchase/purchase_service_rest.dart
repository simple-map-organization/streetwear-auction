import '../../app/dependencies.dart';
import '../../models/purchase.dart';
import '../rest.dart';
import 'purchase_service.dart';

class PurchaseServiceRest implements PurchaseService {
  final rest = dependency<RestService>();

  Future<List<Purchase>> getPurchasedList() async {
    var result = await rest.get('purchase/');

    List<Purchase> purchaseList =
        (result as List).map((json) => Purchase.fromJson(json)).toList();
    return purchaseList;
  }

  Future<Purchase> getUserPurchaseByAuctionId(String auctionId) async {
    var result = await rest.get('purchase/$auctionId');
    if (result == null) return null;
    Purchase purchase = Purchase.fromJson(result);
    return purchase;
  }

  Future<Purchase> getUserPurchaseByUserIdAndAuctionId(
      String auctionId, String userId) async {
    var result = await rest.get('purchase/user/$userId?auctionId=$auctionId');
    if (result == null) return null;
    Purchase purchase = Purchase.fromJson(result);
    return purchase;
  }

  Future<Purchase> updateStatus(String purchaseId, double rating) async {
    var result = rating != -1
        ? await rest.put('purchase/updateStatus/' + purchaseId,
            data: {'rating': rating})
        : await rest.put('purchase/updateStatus/' + purchaseId, data: {});
    return Purchase.fromJson(result);
  }

  Future<void> updatePurchase(
    String purchaseId, {
    String fullname,
    String phone,
    String address1,
    String address2,
    String state,
    String postcode,
  }) async {
    await rest.put('purchase/$purchaseId', data: {
      'fullname': fullname,
      'phone': phone,
      'address1': address1,
      'address2': address2,
      'state': state,
      'postcode': postcode
    });
  }
}
