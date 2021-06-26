import 'dart:ui';

import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../view.dart';
import 'edit_profile_view.dart';
import 'profile_viewmodel.dart';
import 'widgets/profile_list_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<ProfileViewModel>()..init(),
      builder: (context, viewmodel, _) => Scaffold(
        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 140,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Stack(
                            alignment: Alignment.bottomRight,
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 40.0,
                                backgroundImage: viewmodel.user.profilePhoto !=
                                        ""
                                    ? NetworkImage(viewmodel.user.profilePhoto,
                                        scale: 40)
                                    : AssetImage('assets/img/profile.png'),
                                backgroundColor: Colors.transparent,
                              ),
                              Positioned(
                                bottom: -10,
                                right: -10,
                                child: Container(
                                  width: 40,
                                  child: RawMaterialButton(
                                    onPressed: () async {
                                      await viewmodel.chooseImage();
                                    },
                                    fillColor: Colors.white,
                                    child: Icon(Icons.add, size: 15.0),
                                    padding: EdgeInsets.all(1),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              )
                            ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(viewmodel.user.username,
                                  style: TextStyle(fontSize: 14.0)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Rating       : ',
                                style: TextStyle(fontSize: 14.0),
                              ),
                              Text(
                                  '${(viewmodel.user.rating as double).toStringAsFixed(1)}',
                                  style: TextStyle(fontSize: 14.0)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Total Deal : ',
                                  style: TextStyle(fontSize: 14.0)),
                              Text('${viewmodel.user.totalDeal}',
                                  style: TextStyle(fontSize: 14.0)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ProfileListButton(
                      text: 'My Profile',
                      routeName: EditProfileScreen.routeName,
                      user: viewmodel.user,
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          'As Seller',
                          style: TextStyle(fontSize: 16),
                        )),
                    ProfileListButton(text: 'Ongoing Bid'),
                    Divider(
                      height: 1,
                    ),
                    ProfileListButton(text: 'Payment Pending'),
                    Divider(
                      height: 1,
                    ),
                    ProfileListButton(text: 'To Ship'),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          'As Buyer',
                          style: TextStyle(fontSize: 16),
                        )),
                    ProfileListButton(text: 'Completed'),
                    Divider(
                      height: 1,
                    ),
                    ProfileListButton(text: 'To Pay'),
                    Divider(
                      height: 1,
                    ),
                    ProfileListButton(text: 'To Ship'),
                    Divider(
                      height: 1,
                    ),
                    ProfileListButton(text: 'To Receive'),
                    Divider(
                      height: 1,
                    ),
                    ProfileListButton(text: 'To Rate'),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: ElevatedButton(
                        child: Text('Log Out'),
                        onPressed: viewmodel.logOut,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
