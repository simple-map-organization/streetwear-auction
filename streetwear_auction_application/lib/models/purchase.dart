import 'package:flutter/foundation.dart';

import 'auction.dart';

class Purchase {
  String purchaseId;
  Auction product;
  bool won;
  DateTime payBefore; //1 week
  DateTime paidOn;
  String fullname;
  String phone;
  String address1;
  String address2;
  String postcode;
  String state;
  String country;

  Purchase({
    @required this.purchaseId,
    @required this.product,
    @required this.won,
    @required this.payBefore,
    @required this.paidOn,
    @required this.fullname,
    @required this.phone,
    @required this.address1,
    @required this.address2,
    @required this.postcode,
    @required this.state,
    @required this.country,
  });

  Purchase.fromJson(Map<String, dynamic> json)
      : this(
          purchaseId: json['_id'],
          product: Auction.fromJson(json['product']),
          won: json['won'],
          payBefore: json['payBefore'] != null
              ? DateTime.parse(json['payBefore']).toLocal()
              : null,
          paidOn: json['paidOn'] != null
              ? DateTime.parse(json['paidOn']).toLocal()
              : null,
          fullname: json['delivery']['fullname'],
          phone: json['delivery']['phone'],
          address1: json['delivery']['address1'],
          address2: json['delivery']['address2'],
          postcode: json['delivery']['postcode'],
          state: json['delivery']['state'],
          country: json['delivery']['country'],
        );
}
