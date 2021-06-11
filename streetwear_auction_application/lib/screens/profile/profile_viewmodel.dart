import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/user.dart';
import 'package:streetwear_auction_application/services/user/user_service.dart';
import '../viewmodel.dart';

class ProfileViewModel extends Viewmodel {
  UserService get dataService => dependency();
  User user;

  ProfileViewModel();

  void init() async {
    await getUser();
  }

  void getUser() async {
    turnBusy();
    user = await dataService.getUser(userId);
    turnIdle();
  }
}
