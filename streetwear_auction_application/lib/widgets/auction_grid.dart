import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/auction.dart';
import 'auction_card.dart';

class AuctionGrid extends StatelessWidget {
  final List<Auction> auctions;
  final Function(BuildContext, Auction) onCardPressed;

  const AuctionGrid(
      {Key key, @required this.auctions, @required this.onCardPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(0.0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: auctions.length,
      itemBuilder: (BuildContext context, int index) =>
          AuctionCard(auctions[index], onCardPressed),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
    );
  }
}
