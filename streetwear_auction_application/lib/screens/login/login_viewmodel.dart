import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/viewmodel.dart';
import 'package:streetwear_auction_application/services/user/login_service.dart';

class LoginViewModel extends Viewmodel {
  TextEditingController usernameController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;

  LoginService get dataService => dependency();

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
    String id = await dataService.checkCredential(
        usernameController.text, passwordController.text);
    turnIdle();
    if (id != '-1') {
      userId = id;
      return true;
    } else {
      return false;
    }
  }
}
