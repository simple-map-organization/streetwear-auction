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

  Future<Purchase> updateStatus(double rating) async {
    var result = rating != -1
        ? await rest.put('purchase/updateStatus', data: {'rating': rating})
        : await rest.put('purchase/updateStatus', data: {});
    return Purchase.fromJson(result);
  }
}
