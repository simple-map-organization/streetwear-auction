import 'package:flutter/cupertino.dart';
import 'package:streetwear_auction_application/models/purchase.dart';
import 'package:streetwear_auction_application/services/purchase/purchase_service.dart';

import '../../app/dependencies.dart';
import '../viewmodel.dart';

class AuctionCheckoutViewModel extends Viewmodel {
  AuctionCheckoutViewModel();
  Purchase purchase;
  PurchaseService get dataService => dependency();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  String state = 'Perak';
  TextEditingController postcodeController = TextEditingController();
  bool isChecked;
  void changeIsChecked() {
    isChecked = isChecked ? false : true;
    turnIdle();
  }

  void init(Purchase purchase) {
    this.purchase = purchase;
    isChecked = false;
  }

  Future<void> onPay() async {
    print(purchase.purchaseId);
    await dataService.updatePurchase(
      purchase.purchaseId,
      fullname: fullnameController.text,
      phone: phoneNumberController.text,
      address1: address1Controller.text,
      address2: address2Controller.text,
      state: state,
      postcode: postcodeController.text,
    );
  }
}
