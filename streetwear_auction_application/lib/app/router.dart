import 'package:flutter/material.dart';

import '../nav_bar_wrapper.dart';
import '../screens/auction-checkout/auction_checkout_view.dart';
import '../screens/search_auction/search_auction_view.dart';
import '../screens/auction-detail/auction_detail.dart';
import '../screens/image_carousel/image_carousel.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
      return NavBarWrapper.createRoute();
    case ImageCarouselScreen.routeName:
      return ImageCarouselScreen.createRoute(settings.arguments);

    case AuctionDetailScreen.routeName:
      return AuctionDetailScreen.createRoute(settings.arguments);

    case AuctionCheckoutScreen.routeName:
      return AuctionCheckoutScreen.createRoute(settings.arguments);

    case SearchAuctionScreen.routeName:
      return SearchAuctionScreen.createRoute(settings.arguments);
  }
  return null;
}
