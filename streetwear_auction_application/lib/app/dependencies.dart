import 'package:get_it/get_it.dart';
import 'package:streetwear_auction_application/screens/login/login_viewmodel.dart';
import 'package:streetwear_auction_application/screens/profile/edit_profile_viewmodel.dart';
import 'package:streetwear_auction_application/screens/profile/profile_viewmodel.dart';
import 'package:streetwear_auction_application/services/user/login_service.dart';
import 'package:streetwear_auction_application/services/user/login_service_rest.dart';
import 'package:streetwear_auction_application/services/user/user_service.dart';
import 'package:streetwear_auction_application/services/user/user_service_rest.dart';

import '../screens/home/home_viewmodel.dart';
import '../screens/search_auction/search_auction_viewmodel.dart';

import '../services/rest.dart';
import '../services/auction/auction_service.dart';
import '../services/auction/auction_service_rest.dart';

GetIt dependency = GetIt.instance;
String userId;

void init() {
  // Services
  dependency.registerLazySingleton<RestService>(
    () => RestService(baseUrl: 'http://192.168.0.115:3000'),
    // () => RestService(baseUrl: 'http://192.168.0.179:3000'),
  );

  dependency.registerLazySingleton<AuctionService>(() => AuctionServiceRest());
  dependency.registerLazySingleton<LoginService>(() => LoginServiceRest());
  dependency.registerLazySingleton<UserService>(() => UserServiceRest());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  // Viewmodels
  dependency.registerLazySingleton(() => HomeViewModel());
  dependency.registerLazySingleton(() => LoginViewModel());
  dependency.registerLazySingleton(() => SearchAuctionViewModel());
  dependency.registerLazySingleton(() => ProfileViewModel());
  dependency.registerLazySingleton(() => EditProfileViewModel());
}
