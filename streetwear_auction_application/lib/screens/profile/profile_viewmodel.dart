import '../../app/auth.dart';
import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../../services/user/user_service.dart';
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
