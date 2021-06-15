import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../../services/user/user_service.dart';
import '../viewmodel.dart';

class EditProfileViewModel extends Viewmodel {
  UserService get dataService => dependency();
  User user;
  String expiryMonth;
  String expiryYear;

  List<String> stateSelection = [
    'State',
    'Johor',
    'Kedah',
    'Kelantan',
    'Melaka',
    'Negeri Sembilan',
    'Pahang',
    'Perak',
    'Perlis',
    'Pulau Pinang',
    'Sabah',
    'Sarawak',
    'Selangor',
    'Terengganu',
    'W.P. Kuala Lumpur',
    'W.P. Labuan',
    'W.P. Putrajaya',
  ];

  List<String> monthSelection = [
    'MM',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];

  List<String> yearSelection = [
    'YY',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
  ];

  TextEditingController phoneNumController;
  TextEditingController bioController;
  TextEditingController address1Controller;
  TextEditingController address2Controller;
  TextEditingController address3Controller;
  TextEditingController postcodeController;
  TextEditingController countryController;
  TextEditingController cardController;
  TextEditingController cvvController;
  TextEditingController fbLinkController;
  TextEditingController igLinkController;
  TextEditingController lcLinkController;

  EditProfileViewModel();

  void init(user) async {
    turnBusy();
    this.user = user;
    phoneNumController = TextEditingController(text: user.phoneNum);
    bioController = TextEditingController(text: user.bio);
    address1Controller = TextEditingController(text: user.address1);
    address2Controller = TextEditingController(text: user.address2);
    address3Controller = TextEditingController(text: user.address3);
    postcodeController = TextEditingController(text: user.postcode);
    if (user.state == "") {
      user.state = "State";
    }
    countryController = TextEditingController(text: user.country);
    cardController = TextEditingController(text: user.card);
    if (user.expiryDate.length == 4) {
      expiryMonth = user.expiryDate[0] + user.expiryDate[1];
      expiryYear = user.expiryDate[2] + user.expiryDate[3];
    } else {
      expiryMonth = "MM";
      expiryYear = "YY";
    }
    cvvController = TextEditingController(text: user.cvv);
    fbLinkController = TextEditingController(text: user.fbLink);
    igLinkController = TextEditingController(text: user.igLink);
    lcLinkController = TextEditingController(text: user.lcLink);
    turnIdle();
  }

  static String dropdownValue;
  void getValue(String val) {
    dropdownValue = val;
  }

  void updateUser() async {
    turnBusy();
    user.expiryDate = expiryMonth + expiryYear;
    user.phoneNum = phoneNumController.text;
    user.bio = bioController.text;
    user.address1 = address1Controller.text;
    user.address2 = address2Controller.text;
    user.address3 = address3Controller.text;
    user.postcode = postcodeController.text;
    user.card = cardController.text;
    user.cvv = cvvController.text;
    user.fbLink = fbLinkController.text;
    user.igLink = igLinkController.text;
    user.lcLink = lcLinkController.text;
    this.user = await dataService.updateUser(user);
    turnIdle();
  }

  void dropdownStateOnChange(String newState) {
    user.state = newState;
    turnIdle();
  }

  void dropdownMonthOnChange(String newExpiryMonth) {
    expiryMonth = newExpiryMonth;
    turnIdle();
  }

  void dropdownYearOnChange(String newExpiryYear) {
    expiryYear = newExpiryYear;
    turnIdle();
  }
}
