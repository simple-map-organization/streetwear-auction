import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/auction.dart';

class AuctionCard extends StatelessWidget {
  final Auction auction;
  final Function onPressStarIcon;
  final Function(BuildContext, Auction) onPressed;
  AuctionCard(this.auction, this.onPressed, this.onPressStarIcon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(context, auction);
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
                  Container(
                      height: 100,
                      width: double.infinity,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(auction.photos[0]))),
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      child: Container(
                        height: 20.0,
                        width: 20.0,
                        child: Icon(
                          Icons.star,
                          size: 16.0,
                          color: Colors.grey[400],
                        ),
                      ),
                      onTap: () async {
                        final status = await onPressStarIcon(auction.auctionId);
                        if (status == 'Updated') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Added to watchlist successfully!')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Product added already!')));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
              child: Text(
                auction.productName.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
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
                      Text('Highest Bid'),
                      SizedBox(
                        height: 2.0,
                      ),
                      Chip(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        backgroundColor: Colors.transparent,
                        label: Text(
                          auction.bids.length == 0
                              ? 'No Bid'
                              : 'RM${auction.bids[0].price}',
                          style: TextStyle(
                              color: auction.bids.length == 0
                                  ? Colors.green
                                  : Colors.orange[600]),
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                              color: auction.bids.length == 0
                                  ? Colors.green
                                  : Colors.orange[600]),
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
