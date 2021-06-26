import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:streetwear_auction_application/models/auction.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:streetwear_auction_application/models/watchlist.dart';

class WatchlistProductCard extends StatelessWidget {
  final Watchlist watchlist;
  final Auction auction;
  WatchlistProductCard(this.watchlist, this.auction);

  get _isWinning =>
      auction.bids.length > 0 &&
      auction.bids.any((bid) => bid.user.userId == watchlist.user.userId) &&
      auction.bids[0].user.userId == watchlist.user.userId;

  get _isLosing =>
      auction.bids.length > 0 &&
      auction.bids.any((bid) => bid.user.userId == watchlist.user.userId) &&
      auction.bids[0].user.userId != watchlist.user.userId;

  @override
  Widget build(BuildContext context) {
    print(auction.bids.any((bid) => bid.user.userId == watchlist.user.userId));
    return Container(
      padding: EdgeInsets.only(right: 7.0),
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
        color: _isWinning
            ? Color.fromRGBO(123, 255, 66, 1)
            : _isLosing
                ? Color.fromRGBO(255, 117, 117, 1)
                : Color.fromRGBO(166, 166, 166, 1),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 10),
              child: SlideCountdownClock(
                duration: auction.endTime.difference(DateTime.now()),
                slideDirection: SlideDirection.Up,
                separator: ":",
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                onDone: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Auction for ${auction.productName} has ended!')));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        child: Image.network(
                      auction.photos[0],
                      width: 100,
                      height: 100,
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(auction.productName +
                              '\nCondition: ${auction.condition}\n' +
                              'Size: ${auction.size}\n\n' +
                              'Current Bid: RM1300\n' +
                              'End Date: ${DateFormat.yMd().add_jm().format(auction.endTime)}\n'),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
