import 'package:flutter/foundation.dart';

class User {
  String userId;
  String username;
  String email;
  String password;
  String phoneNum;
  String profilePhoto;
  String bio;
  int totalDeal;
  double rating;
  String address1;
  String address2;
  String address3;
  String postcode;
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

  User.fromJson(Map<String, dynamic> json)
      : this(
          userId: json['userId'],
          username: json['username'],
          email: json['email'],
          password: json['password'],
          phoneNum: json['phoneNum'],
          profilePhoto: json['profilePhoto'],
          bio: json['bio'],
          totalDeal: json['totalDeal'],
          rating: json['rating'],
          address1: json['address']['address1'],
          address2: json['address']['address2'],
          address3: json['address']['address3'],
          postcode: json['address']['postcode'],
          state: json['address']['state'],
          country: json['address']['country'],
          card: json['payment']['card'],
          expiryDate: json['payment']['expiryDate'],
          cvv: json['payment']['cvv'],
          fbLink: json['fbLink'],
          igLink: json['igLink'],
          lcLink: json['lcLink'],
        );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'username': username,
        'email': email,
        'password': password,
        'phoneNum': phoneNum,
        'profilePhoto': profilePhoto,
        'bio': bio,
        'totalDeal': totalDeal,
        'rating': rating,
        'address.address1': address1,
        'address.address2': address2,
        'address.address3': address3,
        'address.postcode': postcode,
        'address.state': state,
        'address.country': country,
        'payment.card': card,
        'payment.expiryDate': expiryDate,
        'payment.cvv': cvv,
        'fbLink': fbLink,
        'igLink': igLink,
        'lcLink': lcLink,
      };
}
