import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../view.dart';
import 'seller_product_viewmodel.dart';
import 'widgets/seller_product_card.dart';

class SellerProductScreen extends StatelessWidget {
  static const routeName = '/sellerProduct';
  static Route<dynamic> createRoute() =>
      MaterialPageRoute(builder: (_) => SellerProductScreen());
  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<SellerProductViewModel>()..getList(),
      builder: (context, viewmodel, _) => DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: TextFormField(
              initialValue: viewmodel.searchProductName,
              onFieldSubmitted: viewmodel.onSearchProductName,
              style: TextStyle(fontSize: 12.0),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hintText: 'Search here',
                isDense: true,
                contentPadding: EdgeInsets.all(12.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
                ),
              ),
            ),
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
                Tab(
                    child: Text('Completed',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Tab(
                    child: Text('Cancelled',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                  itemCount: viewmodel.auctions.length,
                  itemBuilder: (context, index) => SellerProductCard(
                    viewmodel.auctions[index],
                    onShip: viewmodel.onPressStatusButton,
                  ),
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
                  itemBuilder: (context, index) => SellerProductCard(
                    viewmodel.auctions[index],
                    onShip: viewmodel.onPressStatusButton,
                  ),
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
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                  itemCount: viewmodel.completedAuctions.length,
                  itemBuilder: (context, index) =>
                      SellerProductCard(viewmodel.completedAuctions[index]),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                  itemCount: viewmodel.cancelledAuctions.length,
                  itemBuilder: (context, index) =>
                      SellerProductCard(viewmodel.cancelledAuctions[index]),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => viewmodel.onPressFloatButton(context),
            child: Icon(
              Icons.add,
              size: 50,
              color: Colors.white,
            ),
            backgroundColor: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
