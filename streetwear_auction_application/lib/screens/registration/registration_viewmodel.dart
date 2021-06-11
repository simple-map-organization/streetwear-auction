import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/main.dart';
import 'package:streetwear_auction_application/screens/viewmodel.dart';
import 'package:streetwear_auction_application/services/registration/registration_service.dart';

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
  CameraDescription camera;
  CameraController controller;
  Future<void> initializeControllerFuture;
  bool isSent;
  bool isChecked;

  RegistrationService get dataService => dependency();

  RegistrationViewModel();

  void init() async {
    turnBusy();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    phoneNoController = TextEditingController();
    emailController = TextEditingController();
    verificationNoController = TextEditingController();
    formKey = GlobalKey<FormState>();
    isSent = false;
    turnIdle();
  }

  void initCamera() async {
    turnBusy();
    controller = CameraController(
      // Get a specific camera from the list of available cameras.
      camera = firstCamera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    initializeControllerFuture = controller.initialize();
    turnIdle();
  }

  void initCheckBox() {
    turnBusy();
    isChecked = false;
    turnIdle();
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

  Future<void> useCamera() async {
    try {
      await initializeControllerFuture;
      await controller.takePicture();
    } catch (e) {
      print(e);
    }
  }
}
