import 'package:flutter/material.dart';

import '../auth_wrapper.dart';
import '../screens/auction_checkout/auction_checkout_view.dart';
import '../screens/auction_detail/auction_detail.dart';
import '../screens/filter_auction/filter_auction.dart';
import '../screens/home/home_view.dart';
import '../screens/image_carousel/image_carousel.dart';
import '../screens/login/login_view.dart';
import '../screens/profile/edit_profile_view.dart';
import '../screens/registration/registration_1_view.dart';
import '../screens/registration/registration_2_view.dart';
import '../screens/registration/registration_3_view.dart';
import '../screens/registration/verification_view.dart';
import '../screens/search_auction/search_auction_view.dart';
import '../screens/seller_product/seller_product_view.dart';
import '../screens/seller_product_detail/seller_product_detail.dart';
import '../screens/start_auction/start_auction_view.dart';
import '../screens/watchlist/watchlist_view.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
      return AuthWrapper.createRoute();

    case LoginScreen.routeName:
      return LoginScreen.createRoute();

    case RegistrationScreen.routeName:
      return RegistrationScreen.createRoute(settings.arguments);

    case RegistrationScreen2.routeName:
      return RegistrationScreen2.createRoute(settings.arguments);

    case RegistrationScreen3.routeName:
      return RegistrationScreen3.createRoute(settings.arguments);

    case VerificationScreen.routeName:
      return VerificationScreen.createRoute(settings.arguments);

    case HomeScreen.routeName:
      return HomeScreen.createRoute(settings.arguments);

    case RegistrationScreen.routeName:
      return RegistrationScreen.createRoute(settings.arguments);

    case ImageCarouselScreen.routeName:
      return ImageCarouselScreen.createRoute(settings.arguments);

    case AuctionDetailScreen.routeName:
      return AuctionDetailScreen.createRoute(settings.arguments);

    case FilterAuction.routeName:
      return FilterAuction.createRoute(settings.arguments);

    case AuctionCheckoutScreen.routeName:
      return AuctionCheckoutScreen.createRoute(settings.arguments);

    case SearchAuctionScreen.routeName:
      return SearchAuctionScreen.createRoute(settings.arguments);

    case EditProfileScreen.routeName:
      return EditProfileScreen.createRoute(settings.arguments);

    case SellerProductDetailScreen.routeName:
      return SellerProductDetailScreen.createRoute(settings.arguments);

    case StartAuctionScreen.routeName:
      return StartAuctionScreen.createRoute(settings.arguments);

    case SellerProductScreen.routeName:
      return SellerProductScreen.createRoute();

    case WatchListScreen.routeName:
      return WatchListScreen.createRoute();
  }
  return null;
}
