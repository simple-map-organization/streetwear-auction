import 'package:flutter/foundation.dart';
import './auction.dart';
import './user.dart';

class Watchlist {
  String watchlistId;
  List<Auction> auctions;
  User user;

  Watchlist({
    @required this.watchlistId,
    @required this.auctions,
    @required this.user,
  });

  Map<String, dynamic> toJson() => {
        '_id': watchlistId,
        'auctions': auctions,
        'user': user,
      };

  Watchlist.fromJson(Map<String, dynamic> json)
      : this(
            watchlistId: json['_id'],
            auctions: List<Auction>.from(
                json['auctions']?.map((x) => Auction.fromJson(x))),
            user: User.fromJson(json['user']));
}
