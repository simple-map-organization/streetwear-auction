import 'package:streetwear_auction_application/app/auth.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/user.dart';
import 'package:streetwear_auction_application/services/user/user_service.dart';
import '../viewmodel.dart';

class ProfileViewModel extends Viewmodel {
  UserService get dataService => dependency();
  AuthService get authService => dependency();
  User user;

  ProfileViewModel();

  Future<void> init() async {
    await getUser();
  }

  Future<void> getUser() async {
    turnBusy();
    user = await dataService.getUser();
    turnIdle();
  }

  void logOut() {
    authService.triggerLogOut();
  }
}
