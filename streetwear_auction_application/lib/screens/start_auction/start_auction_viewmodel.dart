import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/seller_product/seller_product_view.dart';
import 'package:streetwear_auction_application/screens/viewmodel.dart';
import 'package:streetwear_auction_application/services/auction/auction_service.dart';

class StartAuctionViewModel extends Viewmodel {
  TextEditingController productNameController;
  TextEditingController productSKUController;
  TextEditingController shortProductNameController;
  TextEditingController conditionController;
  TextEditingController sizeController;
  GlobalKey<FormState> formKey;

  String sellerId = '60afa472cdec953fc4d5e8ce';
  AuctionService get dataService => dependency();

  StartAuctionViewModel();

  void init() async {
    turnBusy();
    productNameController = TextEditingController();
    productSKUController = TextEditingController();
    shortProductNameController = TextEditingController();
    conditionController = TextEditingController();
    sizeController = TextEditingController();
    formKey = GlobalKey<FormState>();
    turnIdle();
  }

  void createAuction(context) {
    turnBusy();
    dataService.startAuction(
        sellerId: sellerId,
        productName: productNameController.text,
        productSKU: productSKUController.text,
        shortProductName: shortProductNameController.text,
        condition: conditionController.text,
        size: sizeController.text);
    Navigator.of(context).pop();
    Navigator.pushNamed(context, SellerProductScreen.routeName);
    turnIdle();
  }
}
