import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../../models/purchase.dart';
import '../../widgets/seller_profile.dart';
import '../../widgets/winner_profile.dart';
import '../auction_checkout/auction_checkout_view.dart';
import '../auction_detail/widgets/image_carousel.dart';
import '../view.dart';
import 'auction_detail_viewmodel.dart';
import 'widgets/bin_dialog.dart';
import 'widgets/bottom_app_bar.dart';
import 'widgets/place_bid_dialog.dart';

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

  void _openWinnerProfile(context, viewmodel) async {
    Purchase purchase =
        await viewmodel.getUserPurchaseByAuctionId(auction.auctionId);
    if (purchase == null) return;
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
      builder: (_) => WinnerProfile(
        purchase: purchase,
      ),
    );
    return;
  }

  void _placeBid(context, viewmodel) {
    final Auction auction = viewmodel.auction;
    final _bidController =
        TextEditingController(text: auction.minBid.toString());
    final _formKey = GlobalKey<FormState>();
    if (auction.minBid >= auction.bin) return _buyItNow(context, viewmodel);

    showDialog(
      context: context,
      builder: (_) => PlaceBidDialog(auction, _bidController, () async {
        if (!_formKey.currentState.validate()) return;
        Navigator.of(context).pop();
        await viewmodel.onPlaceBid(int.parse(_bidController.text), context);
        final snackBar = SnackBar(
            content:
                Text('Successful place bid @ RM${_bidController.value.text}'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }, _formKey),
    );
  }

  void _buyItNow(context, viewmodel) {
    final Auction auction = viewmodel.auction;
    showDialog(
      context: context,
      builder: (_) => BINDialog(auction, () async {
        Navigator.of(context).pop();
        await viewmodel.onPlaceBid(viewmodel.auction.bin, context);

        var purchase =
            await viewmodel.getUserPurchaseByAuctionId(auction.auctionId);

        Navigator.pushNamed(context, AuctionCheckoutScreen.routeName,
            arguments: {
              'processType': 'BIN',
              'purchase': purchase,
              'price': viewmodel.auction.bin,
              'deliveryFee': viewmodel.auction.deliveryFee
            });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
        viewmodel: dependency<AuctionDetailViewModel>()..init(auction),
        builder: (context, viewmodel, __) {
          return Stack(
            children: [
              Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  titleSpacing: 0,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.grey,
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
                                  CircleAvatar(
                                    radius: 15.0,
                                    backgroundImage:
                                        AssetImage('assets/img/profile.png'),
                                    // backgroundImage:
                                    //     AssetImage('assets/img/profile.png'),
                                    backgroundColor: Colors.transparent,
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
                          SizedBox(height: 16.0),
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
                          SizedBox(height: 6.0),
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
                          SizedBox(height: 6.0),
                          Row(
                            children: [
                              Expanded(child: Text('Starting bid')),
                              Expanded(
                                child: Text(
                                  'RM' +
                                      viewmodel.auction.startingPrice
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Theme.of(context).primaryColor),
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                          SizedBox(height: 6.0),
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
                          SizedBox(height: 6.0),
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
                          SizedBox(height: 6.0),
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
                          SizedBox(height: 6.0),
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
                          SizedBox(height: 6.0),
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
                          SizedBox(height: 12.0),
                          viewmodel.isAuctionOwner ? Divider() : Container(),
                          viewmodel.isAuctionOwner
                              ? Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Winner: ' + auction.winner),
                                      TextButton(
                                          onPressed: () {
                                            _openWinnerProfile(
                                                context, viewmodel);
                                          },
                                          child: Text('View Address'))
                                    ],
                                  ),
                                )
                              : Container(),
                          Divider(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Biddings',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          ...viewmodel.bids
                              .map((bid) => Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15.0,
                                          backgroundImage: AssetImage(
                                              'assets/img/profile.png'),
                                          // backgroundImage:
                                          //     AssetImage('assets/img/profile.png'),
                                          backgroundColor: Colors.transparent,
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
                bottomNavigationBar: !viewmodel.isAuctionOwner
                    ? CustomBottomAppBar(
                        viewmodel.auction.isAllowBid,
                        () => _placeBid(context, viewmodel),
                        () => _buyItNow(context, viewmodel),
                        viewmodel.auction.bin)
                    : null,
              ),
              viewmodel.busy
                  ? Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
            ],
          );
        });
  }
}
