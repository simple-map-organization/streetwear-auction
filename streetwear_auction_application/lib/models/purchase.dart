import 'package:flutter/foundation.dart';

import 'auction.dart';

class Purchase {
  String purchaseId;
  Auction product;
  bool won;
  String status; //Cancelled(failed to pay) if failed to pay
  DateTime payBefore; //1 week
  String address1;
  String address2;
  String address3;
  String postcode;
  String state;
  String country;

  Purchase({
    @required this.purchaseId,
    @required this.product,
    @required this.won,
    @required this.status,
    @required this.payBefore,
    @required this.address1,
    @required this.address2,
    @required this.address3,
    @required this.postcode,
    @required this.state,
    @required this.country,
  });

  Purchase.fromJson(Map<String, dynamic> json)
      : this(
          purchaseId: json['_id'],
          product: Auction.fromJson(json['product']),
          won: json['won'],
          status: json['status'],
          payBefore: json['payBefore'],
          address1: json['address']['address1'],
          address2: json['address']['address2'],
          address3: json['address']['address3'],
          postcode: json['address']['postcode'],
          state: json['address']['state'],
          country: json['address']['country'],
        );
}
