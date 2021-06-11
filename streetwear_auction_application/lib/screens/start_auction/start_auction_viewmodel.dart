import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/auction.dart';
import 'package:streetwear_auction_application/screens/seller_product/seller_product_view.dart';
import 'package:streetwear_auction_application/screens/viewmodel.dart';
import 'package:streetwear_auction_application/services/auction/auction_service.dart';

class StartAuctionViewModel extends Viewmodel {
  TextEditingController productNameController;
  TextEditingController productSKUController;
  TextEditingController shortProductNameController;
  TextEditingController binController;
  //TextEditingController sizeController;
  GlobalKey<FormState> formKey;

  String sellerId = '60afa472cdec953fc4d5e8ce';
  AuctionService get dataService => dependency();

  StartAuctionViewModel();

  List<String> categories = const ['Sneakers', 'Cap', 'Shirt'];
  String category;

  List<String> sizes = const ['US7', 'US8', 'US9'];
  String size;

  List<String> conditions = const ['Average', 'Good', 'Very Good', 'New'];
  String condition;

  void init() async {
    turnBusy();
    productNameController = TextEditingController();
    productSKUController = TextEditingController();
    shortProductNameController = TextEditingController();
    condition = 'Average';
    size = 'US7';
    formKey = GlobalKey<FormState>();
    category = 'Sneakers';
    binController = TextEditingController();
    turnIdle();
  }

  Future<void> createAuction(context) async {
    turnBusy();
    final Auction _auction = await dataService.startAuction(
        sellerId: sellerId,
        productName: productNameController.text,
        productSKU: productSKUController.text,
        shortProductName: shortProductNameController.text,
        condition: condition,
        size: size,
        category: category);
    //print(_auction.auctionId);
    Navigator.of(context).pop(_auction);

    //Navigator.pushNamed(context, SellerProductScreen.routeName);
    turnIdle();
  }

  void changeCategory(String data) {
    turnBusy();
    category = data;
    turnIdle();
  }

  void changeSize(String data) {
    turnBusy();
    size = data;
    turnIdle();
  }

  void changeCondition(String data) {
    turnBusy();
    condition = data;
    turnIdle();
  }
}
