import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/auction.dart';
import 'package:streetwear_auction_application/screens/viewmodel.dart';
import 'package:streetwear_auction_application/services/auction/auction_service.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';

class StartAuctionViewModel extends Viewmodel {
  TextEditingController productNameController;
  TextEditingController productSKUController;
  TextEditingController shortProductNameController;
  TextEditingController binController;
  TextEditingController startingPriceController;
  TextEditingController minIncrementController;
  TextEditingController deliveryFeeController;
  GlobalKey<FormState> formKey;

  String sellerId = '60afa472cdec953fc4d5e8ce';
  AuctionService get dataService => dependency();

  StartAuctionViewModel();

  List<String> categories = const ['Sneakers', 'Cap', 'Shirt'];
  String category;

  List<String> sizes = const ['US7', 'US8', 'US9', 'US10', 'US11', 'US12'];
  String size;

  List<String> conditions = const ['Average', 'Good', 'Very Good', 'New'];
  String condition;

  DateTime selectedDate;

  List<Asset> images;
  List<File> fileImageArray;
  //List<String> f;

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
    startingPriceController = TextEditingController();
    minIncrementController = TextEditingController();
    deliveryFeeController = TextEditingController();
    selectedDate = null;
    images = <Asset>[];
    fileImageArray = [];
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
        category: category,
        bin: int.parse(binController.text),
        startingPrice: int.parse(startingPriceController.text),
        minIncrement: int.parse(minIncrementController.text),
        deliveryFee: int.parse(deliveryFeeController.text),
        endTime: selectedDate,
        listImageFile: fileImageArray);
    Navigator.of(context).pop(_auction);
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

  void changeDate(DateTime data) {
    turnBusy();
    selectedDate = data;
    turnIdle();
  }

  Future<void> loadAssets() async {
    turnBusy();
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: false,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    //if (!mounted) return;
    for (int i = 0; i < resultList.length; i++) {
      var path =
          await FlutterAbsolutePath.getAbsolutePath(resultList[i].identifier);
      fileImageArray.add(File(path));
    }
    images = resultList;
    // _error = error;
    turnIdle();
  }
}
