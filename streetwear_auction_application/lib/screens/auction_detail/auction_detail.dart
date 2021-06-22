import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/view.dart';

import '../../widgets/seller_profile.dart';
import '../auction_checkout/auction_checkout_view.dart';
import '../auction_detail/widgets/image_carousel.dart';
import '../../models/auction.dart';
import './auction_detail_viewmodel.dart';

class AuctionDetailScreen extends StatelessWidget {
  static const routeName = '/auctionDetail';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => AuctionDetailScreen(args['auction']));

  final Auction auction;
  AuctionDetailScreen(this.auction);

  void _openSellerProfile(context, viewmodel) {
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
        user: viewmodel.auction.seller,
      ),
    );
    return;
  }

  void _placeBid(context, viewmodel) {
    final _formKey = GlobalKey<FormState>();

    int minBid = viewmodel.auction.bids.length > 0
        ? viewmodel.auction.bids[0].price + viewmodel.auction.minIncrement
        : viewmodel.auction.startingPrice;
    final _bidController = TextEditingController(text: minBid.toString());

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Enter your bid amount '),
        content: Form(
          key: _formKey,
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value == null || value == '' || int.parse(value) < minBid)
                return 'Minimum bid: RM$minBid';
              return null;
            },
            controller: _bidController,
            decoration: InputDecoration(
                prefixText: 'RM',
                hintText: "Your bid here",
                helperText: 'Minimum bid: RM$minBid'),
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
              if (!_formKey.currentState.validate()) return;
              viewmodel.onPlaceBid(viewmodel.auction.auctionId,
                  int.parse(_bidController.value.text));
              Navigator.of(context).pop();
              // Navigator.pushNamed(context, AuctionCheckoutScreen.routeName);
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
    return ConsumerView(
        viewmodel: dependency<AuctionDetailViewModel>()..init(auction),
        builder: (context, viewmodel, _) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              titleSpacing: 0,
              backgroundColor: Colors.transparent,
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
                  child: Center(child: Text(viewmodel.auction.productName)),
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
                              Text(viewmodel.auction.seller.username),
                            ],
                          ),
                          MaterialButton(
                            onPressed: () =>
                                _openSellerProfile(context, viewmodel),
                            child: Text('View Profile'),
                            textColor: Theme.of(context).primaryColor,
                            shape: Border.all(
                                color: Theme.of(context).primaryColor),
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
                              viewmodel.auction.condition,
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
                              viewmodel.auction.size,
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
                          Expanded(child: Text('Starting bid')),
                          Expanded(
                            child: Text(
                              'RM' + viewmodel.auction.startingPrice.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Theme.of(context).primaryColor),
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
                          Expanded(child: Text('Highest bid')),
                          Expanded(
                            child: Text(
                              viewmodel.auction.bids.length > 0
                                  ? 'RM${viewmodel.auction.bids[0].price}'
                                  : "-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: viewmodel.auction.bids.length > 0
                                    ? Colors.orange[600]
                                    : Colors.green,
                              ),
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
                          Expanded(child: Text('Maximum bid')),
                          Expanded(
                            child: Text(
                              'RM${viewmodel.auction.bin.toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.green,
                              ),
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
                              'RM${viewmodel.auction.minIncrement.toString()}',
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
                              'RM${viewmodel.auction.deliveryFee.toString()}',
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
                              DateFormat.yMd()
                                  .add_jm()
                                  .format(viewmodel.auction.endTime),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            flex: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Biddings',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            // TextButton(
                            //   style: ButtonStyle(
                            //     foregroundColor:
                            //         MaterialStateProperty.all<Color>(
                            //             Colors.black),
                            //   ),
                            //   onPressed: () {},
                            //   child: Text('View More >'),
                            // )
                          ],
                        ),
                      ),
                      ...viewmodel.bids
                          .map((bid) => Container(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      'https://cdn2.iconfinder.com/data/icons/facebook-51/32/FACEBOOK_LINE-01-512.png',
                                      width: 25,
                                      height: 25,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                        '${bid.user.username} bids @RM${bid.price}')
                                  ],
                                ),
                              ))
                          .toList(),
                      TextButton(
                          onPressed: viewmodel.toggleShowBid,
                          child: Text(viewmodel.isShowALlBids
                              ? 'Show less'
                              : 'Show more'))
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
                        onPressed: () => _placeBid(context, viewmodel),
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
                          'Buy It Now\nRM${viewmodel.auction.bin}',
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
        });
  }
}
