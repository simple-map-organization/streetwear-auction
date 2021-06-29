import 'dart:io';

import '../../models/user.dart';

abstract class UserService {
  Future<User> getUser();
  Future<User> updateUser(User user);
  Future<String> uploadPhoto(File imagefile);
}
