import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../app/auth.dart';
import '../../app/dependencies.dart';
import '../viewmodel.dart';
import '../../services/login/login_service.dart';

class LoginViewModel extends Viewmodel {
  final storage = new FlutterSecureStorage();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey;

  LoginService get dataService => dependency();
  AuthService get authService => dependency();

  LoginViewModel();

  void init() async {
    formKey = GlobalKey<FormState>();
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
