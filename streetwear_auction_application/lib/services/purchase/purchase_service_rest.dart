import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/purchase.dart';
import 'package:streetwear_auction_application/services/purchase/purchase_service.dart';

import '../rest.dart';

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
    String status,
    String postcode,
  }) async {
    await rest.put('purchase/$purchaseId', data: {
      'fullname': fullname,
      'phone': phone,
      'address1': address1,
      'address2': address2,
      'state': state,
      'status': status,
      'postcode': postcode
    });
  }
}
