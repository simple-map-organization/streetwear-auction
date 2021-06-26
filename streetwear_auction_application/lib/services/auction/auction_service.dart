import 'dart:io';

import 'package:streetwear_auction_application/models/watchlist.dart';

import '../../models/auction.dart';

abstract class AuctionService {
  Future<List<Auction>> getAuctionList([Map<String, String> filter]);

  Future<List<Auction>> getSellerAuctionList([Map<String, String> filter]);

  Future<void> updateAuctionStatus({String auctionID, String status});

  Future<Auction> bidAuction({String auctionID, int price});

  Future<Auction> startAuction({
    String productName,
    String productSKU,
    String shortProductName,
    String condition,
    String size,
    String category,
    int bin,
    int startingPrice,
    int minIncrement,
    int deliveryFee,
    DateTime endTime,
    List<File> listImageFile,
  });

  Future<String> addAuctionToWatchlist({String auctionID});
}
