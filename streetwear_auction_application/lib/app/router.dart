import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/seller_product_detail/seller_product_detail.dart';
import 'package:streetwear_auction_application/screens/seller_product_search/seller_product_search_view.dart';
import 'package:streetwear_auction_application/screens/seller_product/seller_product_view.dart';
import '../nav_bar_wrapper.dart';
import '../screens/auction_checkout/auction_checkout_view.dart';
import '../screens/search_auction/search_auction_view.dart';
import '../screens/auction_detail/auction_detail.dart';
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

    case SellerProductDetailScreen.routeName:
      return SellerProductDetailScreen.createRoute(settings.arguments);

    case SearchSellerProductScreen.routeName:
      return SearchSellerProductScreen.createRoute(settings.arguments);

    case SellerProductScreen.routeName:
      return SellerProductScreen.route();
  }
  return null;
}
