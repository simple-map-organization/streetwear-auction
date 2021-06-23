import 'package:flutter/foundation.dart';
import './user.dart';

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
  List<Bid> bids;
  String status;
  String trackingLink;
  double rating;
  String category;
  User seller;

  get isAllowBid {
    if (bids.length > 0 && bids[0].price >= bin) return false;
    return true;
  }

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
    @required this.seller,
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
        'seller': seller,
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
            bids: json['bids'].length > 0
                ? List<Bid>.from(json['bids'].map((bid) => Bid.fromJson(bid)))
                    .toList()
                : [],
            status: json['status'],
            trackingLink: json['trackingLink'],
            rating: json['rating'] == null ? 0 : json['rating'] + .0,
            category: json['category'],
            seller: json['seller'].runtimeType != String
                ? User.fromJson(json['seller'])
                : null);
}

class Bid {
  int price;
  User user;

  Bid({this.price, this.user});

  Bid.fromJson(Map<String, dynamic> json)
      : this(
            price: json['price'],
            user: json['userId'].runtimeType != String
                ? User.fromJson(json['userId'])
                : null);

  Map<String, dynamic> toJson() => {'price': this.price, 'userId:': this.user};
}
