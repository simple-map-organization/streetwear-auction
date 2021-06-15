import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/auction_detail/widgets/image_carousel.dart';

import '../../app/dependencies.dart';
import '../../widgets/auction_grid.dart';
import '../view.dart';
import 'home_viewmodel.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  static Route<dynamic> createRoute(args) =>
      MaterialPageRoute(builder: (_) => HomeScreen());

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
                          ].toList(),
                          autoPlay: true,
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        AuctionGrid(
                          auctions: viewmodel.auctions,
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
