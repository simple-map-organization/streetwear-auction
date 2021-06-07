import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streetwear_auction_application/models/auction.dart';
import 'package:streetwear_auction_application/screens/seller_product_detail/seller_product_detail.dart';

class SellerProductCard extends StatelessWidget {
  final Auction auction;
  SellerProductCard(this.auction);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 7.0),
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white,
      ),
      child: ExpansionCard(
        margin: EdgeInsets.only(top: 8, left: 8, right: 8),
        title: Container(
            child: Text(auction.productName,
                style: TextStyle(color: Colors.black))),
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                  SellerProductDetailScreen.routeName,
                  arguments: {'auction': auction});
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Image.network(
                      auction.photos[0],
                      width: 200,
                      height: 200,
                    )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('#${auction.auctionId}\n' +
                                'Date: 4th Mar 2021\n' +
                                'Winning Bid: RM1600\n\n' +
                                'SKU: ${auction.productSKU}\n' +
                                'Condition: ${auction.condition}\n' +
                                'Size: ${auction.size}\n\n' +
                                'Payment Date: 5th Mar 2021 11:00PM\n' +
                                'Receive Date: 8th Mar 2021 01:00PM\n\n' +
                                'Status: ${auction.status}\n'),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: RatingBar.builder(
                                  initialRating: auction.rating,
                                  allowHalfRating: true,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) =>
                                      Icon(Icons.star, color: Colors.amber),
                                  onRatingUpdate: null)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
