import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/auction.dart';

class SellerProductDetailScreen extends StatelessWidget {
  static const routeName = '/sellerProductDetail';
  static MaterialPageRoute createRoute(args) => MaterialPageRoute(
      builder: (_) => SellerProductDetailScreen(args['auction']));

  final Auction auction;
  SellerProductDetailScreen(this.auction);

  // void _openBidding(context) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       backgroundColor: Colors.white,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(24.0),
  //           topRight: Radius.circular(24.0),
  //         ),
  //       ),
  //       context: context,
  //       builder: null
  //       // (_) => BiddingDetails(),
  //       );
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                color: Colors.white,
                child: Image.network(
                  auction.photos[0],
                  width: 200,
                  height: 200,
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(child: Text(auction.productName)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '#${auction.auctionId}\n\n' +
                      'SKU: ${auction.productSKU}\n' +
                      'Condition: ${auction.condition}\n' +
                      'Size: ${auction.size}\n\n' +
                      'End Date: ${auction.endTime}\n' +
                      'Status: ${auction.status}\n\n',
                ),
              ),
            ),
            (auction.rating != 0)
                ? Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: RatingBar.builder(
                        initialRating: auction.rating,
                        allowHalfRating: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: null))
                : SizedBox(),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Winner: Xiang_Yeoh'),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text('View Profile >'),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Biddings'),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {},
                    child: Text('View More >'),
                  )
                ],
              ),
            ),
            InkWell(
              //onTap: () => _openBidding(context),
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.grey),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('BIN by chong_lim @ RM1800'),
                  trailing: Text('9:03 AM'),
                ),
              ),
            ),
            InkWell(
              //onTap: () => _openBidding(context),
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.grey),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Highest bid by Jason @ RM1345'),
                  trailing: Text('9:03 AM'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
