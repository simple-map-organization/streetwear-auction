import 'dart:io';

import 'package:streetwear_auction_application/models/user.dart';

abstract class UserService {
  Future<User> getUser();
  Future<User> updateUser(User user);
  Future<String> uploadPhoto(File imagefile);
}
