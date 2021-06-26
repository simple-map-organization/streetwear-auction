import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:streetwear_auction_application/screens/auction_detail/auction_detail.dart';

import '../../../models/auction.dart';

class SellerProductCard extends StatelessWidget {
  final Auction auction;
  final Function onShip;
  SellerProductCard(this.auction, {this.onShip});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AuctionDetailScreen.routeName,
            arguments: {'auction': auction});
      },
      child: Container(
        margin: EdgeInsets.only(top: 8, left: 8, right: 8),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                auction.productName,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        child: Image.network(
                      auction.photos[0],
                      width: double.infinity,
                      height: 130,
                      fit: BoxFit.fill,
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
                          child: Text('#${auction.auctionId}\n' +
                              'SKU: ${auction.productSKU}\n' +
                              'Condition: ${auction.condition}\n' +
                              'Size: ${auction.size}\n\n' +
                              'End Date: ${DateFormat.yMd().add_jm().format(auction.endTime)}\n' +
                              'Status: ${auction.status}\n'),
                        ),
                        (auction.rating != -1)
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: RatingBar.builder(
                                    ignoreGestures: true,
                                    itemSize: 20,
                                    initialRating: auction.rating,
                                    allowHalfRating: true,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: null))
                            : SizedBox(),
                        (onShip != null && auction.status == 'To Ship')
                            ? Container(
                                margin: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                width: double.infinity,
                                height: 28,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await onShip(
                                        auction.auctionId, 'To Receive');
                                  },
                                  child: Text('Ship'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context).primaryColor),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 28,
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
