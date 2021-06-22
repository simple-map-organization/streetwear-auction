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
          totalDeal: json['totalDeal'] != null ? json['totalDeal'] : -1,
          rating: json['rating'] != null ? json['rating'] + .0 : -1,
          address1:
              json['address'] != null ? json['address']['address1'] : null,
          address2:
              json['address'] != null ? json['address']['address2'] : null,
          address3:
              json['address'] != null ? json['address']['address3'] : null,
          postcode:
              json['address'] != null ? json['address']['postcode'] : null,
          state: json['address'] != null ? json['address']['state'] : null,
          country: json['address'] != null ? json['address']['country'] : null,
          card: json['payment'] != null ? json['address']['card'] : null,
          expiryDate:
              json['payment'] != null ? json['payment']['expiryDate'] : null,
          cvv: json['payment'] != null ? json['address']['cvv'] : null,
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
