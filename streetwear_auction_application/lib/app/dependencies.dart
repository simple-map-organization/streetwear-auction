import 'package:get_it/get_it.dart';
import 'package:streetwear_auction_application/screens/seller_product/seller_product_viewmodel.dart';

import '../screens/home/home_viewmodel.dart';
import '../screens/search_auction/search_auction_viewmodel.dart';

import '../services/rest.dart';
import '../services/auction/auction_service.dart';
import '../services/auction/auction_service_rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton<RestService>(
    () => RestService(baseUrl: 'http://192.168.68.107:3000'),
  );

  dependency.registerLazySingleton<AuctionService>(() => AuctionServiceRest());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  // Viewmodels
  dependency.registerLazySingleton(() => HomeViewModel());
  dependency.registerLazySingleton(() => SearchAuctionViewModel());
  dependency.registerLazySingleton(() => SellerProductViewModel());
}
