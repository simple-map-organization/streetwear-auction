import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:streetwear_auction_application/models/auction.dart';

class Noti {
  String id;
  String userId;
  String shortProductName;
  Auction auction;
  String type;
  DateTime dateTime;
  bool read;

  Noti(
      {@required this.id,
      @required this.userId,
      @required this.shortProductName,
      @required this.type,
      @required this.dateTime,
      @required this.auction,
      @required this.read});

  Map<String, dynamic> toJson() => {
        'id': id,
        'userID': userId,
        'shortProductName': shortProductName,
        'type': type,
        'dateTime': dateTime,
        'auction': auction,
        'read': read,
      };

  Noti.fromJson(Map<String, dynamic> json)
      : this(
          id: json['_id'],
          userId: json['userId'],
          shortProductName: json['shortProductName'],
          type: json['type'],
          dateTime: DateTime.parse(json['dateTime']),
          auction: Auction.fromJson(json['auctionId']),
          read: json['read'],
        );
}
