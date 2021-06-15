import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/seller_profile.dart';
import '../auction_checkout/auction_checkout_view.dart';
import '../auction_detail/widgets/image_carousel.dart';
import '../../models/auction.dart';

class AuctionDetailScreen extends StatelessWidget {
  static const routeName = '/auctionDetail';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => AuctionDetailScreen(args['auction']));

  final Auction auction;
  AuctionDetailScreen(this.auction);

  void _openSellerProfile(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      context: context,
      builder: (_) => SellerProfile(
        user: auction.seller,
      ),
    );
    return;
  }

  void _placeBid(context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Container(
          child: Wrap(
            children: [
              Text('Enter your bid amount '),
              Text('Current highest bid: RM${auction.bids[0]['price']}'),
              Row(
                children: [
                  Text('Your Bid: '),
                  Text('Rm1000000'),
                ],
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, AuctionCheckoutScreen.routeName);
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void _buyItNow(context) {
    Navigator.pushNamed(context, AuctionCheckoutScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCarouselWidget(auction.photos
              .map((image) => Image.network(
                    image,
                    fit: BoxFit.contain,
                  ))
              .toList()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Center(child: Text(auction.productName)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://cdn2.iconfinder.com/data/icons/facebook-51/32/FACEBOOK_LINE-01-512.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 4.0),
                        Text(auction.seller.username),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () => _openSellerProfile(context),
                      child: Text('View Profile'),
                      textColor: Theme.of(context).primaryColor,
                      shape: Border.all(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(child: Text('Condition')),
                    Expanded(
                      child: Text(
                        auction.condition,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Expanded(child: Text('Size')),
                    Expanded(
                      child: Text(
                        auction.size,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Expanded(child: Text('Min Inc')),
                    Expanded(
                      child: Text(
                        'RM${auction.minIncrement.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Expanded(child: Text('Delivery Fee')),
                    Expanded(
                      child: Text(
                        'RM${auction.deliveryFee.toString()}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Expanded(child: Text('End time')),
                    Expanded(
                      child: Text(
                        DateFormat.yMd().add_jm().format(auction.endTime),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
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
                      title: Text('chong_lim @ RM1800'),
                      trailing: Text('9:03 AM'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _placeBid(context),
                  child: Text(
                    'Place Bid',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  color: Colors.green,
                  onPressed: () => _buyItNow(context),
                  child: Text(
                    'Buy It Now\nRM${auction.bin}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
