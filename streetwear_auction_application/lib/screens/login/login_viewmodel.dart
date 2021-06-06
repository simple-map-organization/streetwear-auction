import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/viewmodel.dart';
import 'package:streetwear_auction_application/services/user/user_service.dart';

class LoginViewModel extends Viewmodel {
  TextEditingController usernameController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;
  String userId;

  LoginService get dataService => dependency();

  LoginViewModel();

  void init() async {
    turnBusy();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    turnIdle();
  }

  Future<String> checkCredential() async {
    turnBusy();
    String id = await dataService.checkCredential(
        usernameController.text, passwordController.text);
    turnIdle();
    return id;
  }
}
