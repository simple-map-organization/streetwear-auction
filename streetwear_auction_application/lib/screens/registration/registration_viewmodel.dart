import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/dependencies.dart';
import '../../services/registration/registration_service.dart';
import '../viewmodel.dart';

String username;
String password;
String phoneNo;
String email;

class RegistrationViewModel extends Viewmodel {
  TextEditingController usernameController;
  TextEditingController passwordController;
  TextEditingController phoneNoController;
  TextEditingController emailController;
  TextEditingController verificationNoController;
  GlobalKey<FormState> formKey;
  PickedFile pickedFile;
  bool isSent;
  bool isChecked = false;

  RegistrationService get dataService => dependency();

  RegistrationViewModel();

  void init() async {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    phoneNoController = TextEditingController();
    emailController = TextEditingController();
    verificationNoController = TextEditingController();
    formKey = GlobalKey<FormState>();
    isSent = false;
  }

  Future<bool> register() async {
    turnBusy();
    int isRegistered =
        await dataService.register(username, password, email, phoneNo);
    turnIdle();
    return isRegistered != -1 ? true : false;
  }

  void setVariables() {
    turnBusy();
    username = usernameController.text;
    password = passwordController.text;
    phoneNo = phoneNoController.text;
    email = emailController.text;
    turnIdle();
  }

  Future<String> checkUsername() async {
    if (verificationNoController.text != '123456')
      return 'The verification code is incorrect, please try again.';
    turnBusy();
    String availableStatus = await dataService.checkUsername(
        usernameController.text, emailController.text);
    turnIdle();
    return availableStatus;
  }

  void setIsSent() {
    turnBusy();
    isSent = true;
    turnIdle();
  }

  void setIsChecked() {
    turnBusy();
    isChecked = isChecked ? false : true;
    turnIdle();
  }

  Future<PickedFile> chooseImage() async {
    final _picker = ImagePicker();
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
    return pickedFile;
  }
}
