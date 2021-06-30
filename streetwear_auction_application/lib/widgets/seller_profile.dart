import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/user.dart';

class SellerProfile extends StatelessWidget {
  final User user;
  const SellerProfile({Key key, this.user}) : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage:
                                AssetImage('assets/img/profile.png'),
                            // backgroundImage:
                            //     AssetImage('assets/img/profile.png'),
                            backgroundColor: Colors.transparent,
                          ),
                          Text(user.username),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Rating'),
                          user.rating == -1
                              ? Text(
                                  'No Rating',
                                  style: TextStyle(fontSize: 10.0),
                                )
                              : RatingBar.builder(
                                  ignoreGestures: true,
                                  itemSize: 12.0,
                                  initialRating: user.rating,
                                  allowHalfRating: true,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) =>
                                      Icon(Icons.star, color: Colors.amber),
                                  onRatingUpdate: null),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Total Deals'),
                          Text(
                            user.totalDeal.toString(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 8.0, color: Colors.grey[300]),
              Container(
                constraints: BoxConstraints(minHeight: 80.0),
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Text(user.bio),
              ),
              Container(height: 8.0, color: Colors.grey[200]),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visit seller',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Image(
                              image: AssetImage('assets/img/facebook.png'),
                            ),
                            onPressed: () => _launchInBrowser(user.fbLink)),
                        IconButton(
                            icon: Image(
                              image: AssetImage('assets/img/instagram.png'),
                            ),
                            onPressed: () => _launchInBrowser(user.igLink)),
                        IconButton(
                            icon: Icon(
                              Icons.link,
                              size: 34.0,
                            ),
                            onPressed: () => _launchInBrowser(user.lcLink)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
