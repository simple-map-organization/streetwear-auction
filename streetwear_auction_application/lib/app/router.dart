import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/home/home_view.dart';
import 'package:streetwear_auction_application/screens/login/login_view.dart';
import 'package:streetwear_auction_application/screens/registration/registration_1_view.dart';
import 'package:streetwear_auction_application/screens/registration/registration_2_view.dart';
import 'package:streetwear_auction_application/screens/registration/registration_3_view.dart';
import 'package:streetwear_auction_application/screens/registration/verification_view.dart';

import '../nav_bar_wrapper.dart';
import '../screens/auction_checkout/auction_checkout_view.dart';
import '../screens/search_auction/search_auction_view.dart';
import '../screens/auction_detail/auction_detail.dart';
import '../screens/image_carousel/image_carousel.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
      return NavBarWrapper.createRoute();

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

    case AuctionCheckoutScreen.routeName:
      return AuctionCheckoutScreen.createRoute(settings.arguments);

    case SearchAuctionScreen.routeName:
      return SearchAuctionScreen.createRoute(settings.arguments);
  }
  return null;
}
