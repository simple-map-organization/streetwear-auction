import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../widgets/auction-grid.dart';
import '../view.dart';
import 'home_viewmodel.dart';
import 'widgets/categories.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  static Route<dynamic> route() =>
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
                SearchBar(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(0.0),
                    children: [
                      Categories(),
                      SizedBox(
                        height: 12.0,
                      ),
                      AuctionGrid(
                        auctions: viewmodel.auctions,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
