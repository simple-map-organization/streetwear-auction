import 'dart:convert';
import 'dart:io';

import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest.dart';
import 'user_service.dart';

class UserServiceRest implements UserService {
  final rest = dependency<RestService>();
  Future<User> getUser() async {
    var jsonResult = await rest.get('user');
    return User.fromJson(jsonResult);
  }

  Future<User> updateUser(User user) async {
    var jsonResult = await rest.put('user', data: user.toJson());
    return User.fromJson(jsonResult);
  }

  Future<String> uploadPhoto(File imagefile) async {
    String base64Image = base64Encode(imagefile.readAsBytesSync());
    String fileName = imagefile.path.split("/").last;
    return await rest.put('user/uploadImage', data: {
      "image": base64Image,
      "name": fileName,
    });
  }
}
