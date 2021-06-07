import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/view.dart';

import 'seller_product_viewmodel.dart';
import 'widgets/seller_product_card.dart';
import 'widgets/seller_product_search_bar.dart';

class SellerProductScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => SellerProductScreen());
  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<SellerProductViewModel>()..getList(),
      builder: (context, viewmodel, _) => DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: 4.0, color: Theme.of(context).primaryColor),
              ),
              tabs: [
                Tab(
                    child: Text('All',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Tab(
                    child: Text('Ongoing Bid',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Tab(
                    child: Text('Payment Pending',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Tab(
                    child: Text('To Ship',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Tab(
                    child: Text('Shipped',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
              ],
            ),
            title: SellerProductSearchBar(
              onPressSearchBar: viewmodel.onPressSearchBar,
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                  itemCount: viewmodel.auctions.length,
                  itemBuilder: (context, index) =>
                      SellerProductCard(viewmodel.auctions[index]),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                  itemCount: viewmodel.ongoingAuctions.length,
                  itemBuilder: (context, index) =>
                      SellerProductCard(viewmodel.ongoingAuctions[index]),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                  itemCount: viewmodel.paymentPendingAuctions.length,
                  itemBuilder: (context, index) => SellerProductCard(
                      viewmodel.paymentPendingAuctions[index]),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                  itemCount: viewmodel.toShipAuctions.length,
                  itemBuilder: (context, index) =>
                      SellerProductCard(viewmodel.toShipAuctions[index]),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                  itemCount: viewmodel.shippedAuctions.length,
                  itemBuilder: (context, index) =>
                      SellerProductCard(viewmodel.shippedAuctions[index]),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            // onPressed: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) => StartAuction()),
            // ),
            onPressed: () {},
            child: Icon(
              Icons.add,
              size: 50,
              color: Colors.white,
            ),
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
