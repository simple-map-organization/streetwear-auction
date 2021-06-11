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

  List<String> categories = const ['Sneaker', 'Cap', 'Shirt'];
  String dropdownValue;
  String category = '';

  void init() async {
    turnBusy();
    productNameController = TextEditingController();
    productSKUController = TextEditingController();
    shortProductNameController = TextEditingController();
    conditionController = TextEditingController();
    sizeController = TextEditingController();
    formKey = GlobalKey<FormState>();
    dropdownValue = 'Sneaker';
    turnIdle();
  }

  Future<void> createAuction(context) async {
    turnBusy();
    //final Auction _auction=
    await dataService.startAuction(
        sellerId: sellerId,
        productName: productNameController.text,
        productSKU: productSKUController.text,
        shortProductName: shortProductNameController.text,
        condition: conditionController.text,
        size: sizeController.text,
        category: dropdownValue);
    Navigator.of(context).pop();

    //Navigator.pushNamed(context, SellerProductScreen.routeName);
    turnIdle();
  }

  void changeCategory(String data) {
    turnBusy();
    dropdownValue = data;
    turnIdle();
  }
}
