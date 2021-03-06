import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../widgets/auction_grid.dart';
import '../auction_detail/widgets/image_carousel.dart';
import '../view.dart';
import 'home_viewmodel.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  static Route<dynamic> createRoute(args) =>
      MaterialPageRoute(builder: (_) => HomeScreen());

  HomeScreen();
  @override
  Widget build(BuildContext context) {
    return ConsumerView(
        viewmodel: dependency<HomeViewModel>()..getList(),
        builder: (context, viewmodel, _) {
          return Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                SearchBar(
                  onPressSearchBar: viewmodel.onPressSearchBar,
                  notificationCount: viewmodel.notificationCount,
                  init: viewmodel.getList,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        ImageCarouselWidget(
                          [
                            Image(image: AssetImage('assets/img/1.jpg')),
                            Image(image: AssetImage('assets/img/2.jpg')),
                            Image(image: AssetImage('assets/img/3.jpg')),
                            Image(image: AssetImage('assets/img/4.jpg')),
                            Image(image: AssetImage('assets/img/5.jpg')),
                          ].toList(),
                          autoPlay: true,
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        viewmodel.busy
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : AuctionGrid(
                                auctions: viewmodel.auctions,
                                onPressStarIcon: viewmodel.onPressStarIcon,
                                onCardPressed: viewmodel.onCardPressed,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
