import 'package:flutter/foundation.dart';

class User {
  String userId;
  String username;
  String email;
  String password;
  String phoneNum;
  String profilePhoto;
  String bio;
  double totalDeal;
  double rating;
  String address1;
  String address2;
  String address3;
  int postcode;
  String state;
  String country;
  String card;
  String expiryDate;
  String cvv;
  String fbLink;
  String igLink;
  String lcLink;

  User({
    @required this.userId,
    @required this.username,
    @required this.email,
    @required this.password,
    @required this.phoneNum,
    @required this.profilePhoto,
    @required this.bio,
    @required this.totalDeal,
    @required this.rating,
    @required this.address1,
    @required this.address2,
    @required this.address3,
    @required this.postcode,
    @required this.state,
    @required this.country,
    @required this.card,
    @required this.expiryDate,
    @required this.cvv,
    @required this.fbLink,
    @required this.igLink,
    @required this.lcLink,
  });
}
