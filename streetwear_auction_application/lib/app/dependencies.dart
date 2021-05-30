import 'package:get_it/get_it.dart';

import '../services/rest.dart';
import '../services/auction/auction_service.dart';
import '../services/auction/auction_service_rest.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton<RestService>(
    () => RestService(baseUrl: 'http://192.168.0.5:3000'),
  );

  dependency.registerLazySingleton<AuctionService>(() => AuctionServiceRest());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  // Viewmodels
  // dependency.registerLazySingleton(() => UserViewmodel());
}
