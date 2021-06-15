import 'package:get_it/get_it.dart';
import 'package:streetwear_auction_application/app/auth.dart';
import 'package:streetwear_auction_application/screens/login/login_viewmodel.dart';

import 'package:streetwear_auction_application/screens/profile/edit_profile_viewmodel.dart';
import 'package:streetwear_auction_application/screens/profile/profile_viewmodel.dart';

import 'package:streetwear_auction_application/screens/registration/registration_viewmodel.dart';
import 'package:streetwear_auction_application/services/login/login_service.dart';
import 'package:streetwear_auction_application/services/login/login_service_rest.dart';
import 'package:streetwear_auction_application/services/registration/registration_service.dart';
import 'package:streetwear_auction_application/services/registration/registration_service_rest.dart';

import 'package:streetwear_auction_application/services/user/user_service.dart';
import 'package:streetwear_auction_application/services/user/user_service_rest.dart';

import 'package:streetwear_auction_application/screens/seller_product/seller_product_viewmodel.dart';
import 'package:streetwear_auction_application/screens/start_auction/start_auction_viewmodel.dart';

import '../screens/home/home_viewmodel.dart';
import '../screens/search_auction/search_auction_viewmodel.dart';

import '../services/rest.dart';
import '../services/auction/auction_service.dart';
import '../services/auction/auction_service_rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton<RestService>(
    () => RestService(baseUrl: 'http://192.168.43.208:3000'),
  );

  dependency.registerLazySingleton<AuthService>(() => AuthService());

  dependency.registerLazySingleton<AuctionService>(() => AuctionServiceRest());
  dependency.registerLazySingleton<LoginService>(() => LoginServiceRest());

  dependency.registerLazySingleton<UserService>(() => UserServiceRest());

  dependency.registerLazySingleton<RegistrationService>(
      () => RegistrationServiceRest());

  // Viewmodels
  dependency.registerLazySingleton(() => HomeViewModel());
  dependency.registerLazySingleton(() => LoginViewModel());
  dependency.registerLazySingleton(() => RegistrationViewModel());
  dependency.registerLazySingleton(() => SearchAuctionViewModel());

  dependency.registerLazySingleton(() => ProfileViewModel());
  dependency.registerLazySingleton(() => EditProfileViewModel());

  dependency.registerLazySingleton(() => SellerProductViewModel());
  dependency.registerLazySingleton(() => StartAuctionViewModel());
}
