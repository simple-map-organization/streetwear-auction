import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/auction_detail/auction_detail.dart';
import '../models/auction.dart';

class AuctionCard extends StatelessWidget {
  final Auction auction;
  AuctionCard(this.auction);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AuctionDetailScreen.routeName,
            arguments: {'auction': auction});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
              child: Stack(
                children: [
                  Image.network(auction.photos[0]),
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.star,
                      size: 16.0,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
              child: Text(
                auction.productName,
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Current Bid'),
                      SizedBox(
                        height: 2.0,
                      ),
                      Chip(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        backgroundColor: Colors.transparent,
                        label: Text(
                          'RM10',
                          style: TextStyle(color: Colors.green),
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('BIN'),
                      SizedBox(
                        height: 2.0,
                      ),
                      Chip(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        backgroundColor: Colors.transparent,
                        label: Text(
                          'RM${auction.bin}',
                          style: TextStyle(color: Colors.red),
                        ),
                        shape:
                            StadiumBorder(side: BorderSide(color: Colors.red)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(auction.productSKU),
                    Text('Condition: ${auction.condition}'),
                    Text('Size: ${auction.size}'),
                    SizedBox(height: 8.0),
                    Text(
                        'End time: ${DateFormat.yMd().add_jm().format(auction.endTime)}'),
                    SizedBox(height: 12.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
