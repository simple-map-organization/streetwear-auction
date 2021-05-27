import 'package:get_it/get_it.dart';
import 'package:streetwear_auction_application/services/rest_service.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton<RestService>(() => RestService());

  // Viewmodels
}
