import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          Icon(Icons.person),
                          Text(user.username),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Rating'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: user.rating == 0
                                ? [
                                    Text(
                                      'No Rating',
                                      style: TextStyle(fontSize: 10.0),
                                    )
                                  ]
                                : List.filled(
                                    user.rating.ceil(),
                                    Icon(
                                      Icons.star,
                                      size: 12.0,
                                      color: Colors.yellow,
                                    )),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Total Deals'),
                          Text(
                            '666',
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
                            icon: Icon(Icons.open_in_browser),
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
