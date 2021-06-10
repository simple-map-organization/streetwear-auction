import 'package:flutter/foundation.dart';

class Auction {
  String auctionId;
  String productName;
  String productSKU;
  String shortProductName;
  String condition;
  String size;
  int startingPrice;
  int minIncrement;
  int bin;
  int deliveryFee;
  DateTime endTime;
  List<String> photos;
  List<Map> bids;
  String status;
  String trackingLink;
  double rating;
  String category;

  Auction({
    @required this.auctionId,
    @required this.productName,
    @required this.productSKU,
    @required this.shortProductName,
    @required this.condition,
    @required this.size,
    @required this.startingPrice,
    @required this.minIncrement,
    @required this.bin,
    @required this.deliveryFee,
    @required this.endTime,
    @required this.photos,
    @required this.bids,
    @required this.status,
    @required this.trackingLink,
    @required this.rating,
    @required this.category,
  });

  Map<String, dynamic> toJson() => {
        '_id': auctionId,
        'productName': productName,
        'productSKU': productSKU,
        'shortProductName': shortProductName,
        'condition': condition,
        'size': size,
        'startingPrice': startingPrice,
        'minIncrement': minIncrement,
        'bin': bin,
        'deliveryFee': deliveryFee,
        'endTime': endTime.millisecondsSinceEpoch,
        'photos': photos,
        'bids': bids,
        'status': status,
        'trackingLink': trackingLink,
        'rating': rating,
        'category': category,
      };

  Auction.fromJson(Map<String, dynamic> json)
      : this(
            auctionId: json['_id'],
            productName: json['productName'],
            productSKU: json['productSKU'],
            shortProductName: json['shortProductName'],
            condition: json['condition'],
            size: json['size'],
            startingPrice: json['startingPrice'],
            minIncrement: json['minIncrement'],
            bin: json['bin'],
            deliveryFee: json['deliveryFee'],
            endTime: DateTime.parse(json['endTime']),
            photos: List<String>.from(json['photos']),
            bids: List<Map>.from(
                json['bids']?.map((x) => x)), //need use class User
            status: json['status'],
            trackingLink: json['trackingLink'],
            rating:
                json['rating'] == null ? 0 : json['rating'] + .0, //TODO: seller
            category: json['category']);
}
