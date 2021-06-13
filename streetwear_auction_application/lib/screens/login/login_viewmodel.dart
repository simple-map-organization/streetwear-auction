import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:streetwear_auction_application/app/auth.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/viewmodel.dart';
import 'package:streetwear_auction_application/services/user/login_service.dart';

class LoginViewModel extends Viewmodel {
  final storage = new FlutterSecureStorage();
  TextEditingController usernameController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;

  LoginService get dataService => dependency();
  AuthService get authService => dependency();

  LoginViewModel();

  void init() async {
    turnBusy();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    turnIdle();
  }

  Future<bool> checkCredential() async {
    turnBusy();
    String jwt = await dataService.checkCredential(
        usernameController.text, passwordController.text);
    turnIdle();
    if (jwt != '-1') {
      await authService.triggerLogIn(jwt);
      return true;
    } else {
      return false;
    }
  }
}
