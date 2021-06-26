import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../app/auth.dart';
import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../../services/user/user_service.dart';
import '../viewmodel.dart';

class ProfileViewModel extends Viewmodel {
  UserService get dataService => dependency();
  AuthService get authService => dependency();
  User user;
  PickedFile pickedFile;

  ProfileViewModel();

  Future<void> init() async {
    await getUser();
  }

  Future<void> getUser() async {
    turnBusy();
    user = await dataService.getUser();
    turnIdle();
  }

  Future<void> chooseImage() async {
    final _picker = ImagePicker();
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String photourl = await dataService.uploadPhoto(file);
      user.profilePhoto = photourl;
      turnIdle();
    }
  }

  void logOut() {
    authService.triggerLogOut();
  }
}
