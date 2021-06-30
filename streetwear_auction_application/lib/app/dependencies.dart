import 'package:get_it/get_it.dart';

import '../screens/auction_detail/auction_detail_viewmodel.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/login/login_viewmodel.dart';
import '../screens/my_purchase/purchase_viewmodel.dart';
import '../screens/notification/notification_viewmodel.dart';
import '../screens/profile/edit_profile_viewmodel.dart';
import '../screens/profile/profile_viewmodel.dart';
import '../screens/registration/registration_viewmodel.dart';
import '../screens/search_auction/search_auction_viewmodel.dart';
import '../screens/seller_product/seller_product_viewmodel.dart';
import '../screens/start_auction/start_auction_viewmodel.dart';
import '../screens/watchlist/watchlist_viewmodel.dart';
import '../services/auction/auction_service.dart';
import '../services/auction/auction_service_rest.dart';
import '../services/login/login_service.dart';
import '../services/login/login_service_rest.dart';
import '../services/notification/notification_service.dart';
import '../services/notification/notification_service_rest.dart';
import '../services/purchase/purchase_service.dart';
import '../services/purchase/purchase_service_rest.dart';
import '../services/registration/registration_service.dart';
import '../services/registration/registration_service_rest.dart';
import '../services/rest.dart';
import '../services/user/user_service.dart';
import '../services/user/user_service_rest.dart';
import '../services/watchlist/watchlist_service.dart';
import '../services/watchlist/watchlist_service_rest.dart';
import 'auth.dart';

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
  dependency
      .registerLazySingleton<WatchlistService>(() => WatchlistServiceRest());
  dependency
      .registerLazySingleton<PurchaseService>(() => PurchaseServiceRest());
  dependency.registerLazySingleton<NotificationService>(
      () => NotificationServiceRest());

  // Viewmodels
  dependency.registerLazySingleton(() => HomeViewModel());
  dependency.registerLazySingleton(() => LoginViewModel());
  dependency.registerLazySingleton(() => RegistrationViewModel());
  dependency.registerLazySingleton(() => SearchAuctionViewModel());
  dependency.registerLazySingleton(() => ProfileViewModel());
  dependency.registerLazySingleton(() => EditProfileViewModel());
  dependency.registerLazySingleton(() => SellerProductViewModel());
  dependency.registerLazySingleton(() => StartAuctionViewModel());
  dependency.registerLazySingleton(() => WatchlistViewModel());
  dependency.registerLazySingleton(() => PurchaseViewModel());
  dependency.registerLazySingleton(() => AuctionDetailViewModel());
  dependency.registerLazySingleton(() => NotificationViewModel());
}
