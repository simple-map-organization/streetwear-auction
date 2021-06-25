import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../models/auction.dart';
import '../../seller_product_detail/seller_product_detail.dart';

class ToShipCard extends StatelessWidget {
  final Auction auction;
  final Function onPressStatusButton;
  ToShipCard(this.auction, this.onPressStatusButton);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SellerProductDetailScreen.routeName,
            arguments: {'auction': auction});
      },
      child: Container(
        margin: EdgeInsets.only(top: 8, left: 8, right: 8),
        padding: EdgeInsets.all(12),
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
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Image.network(
                      auction.photos[0],
                      width: 100,
                      height: 100,
                    )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('#${auction.auctionId}\n' +
                              'SKU: ${auction.productSKU}\n' +
                              'Condition: ${auction.condition}\n' +
                              'Size: ${auction.size}\n\n' +
                              'End Date:\n ${auction.endTime}\n\n' +
                              'Status: ${auction.status}\n'),
                        ),
                        (auction.rating != 0)
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: RatingBar.builder(
                                    itemSize: 20,
                                    initialRating: auction.rating,
                                    allowHalfRating: true,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: null))
                            : SizedBox(),
                      ]),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () async {
                        await onPressStatusButton(
                            auction.auctionId, 'To Receive');
                      },
                      child: Text(
                        'Ship',
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
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
