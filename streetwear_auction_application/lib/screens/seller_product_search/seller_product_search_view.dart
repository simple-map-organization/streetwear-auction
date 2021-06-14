import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/seller_product/widgets/seller_product_card.dart';

import '../../app/dependencies.dart';
import '../view.dart';
import 'seller_product_search_viewmodel.dart';

class SearchSellerProductScreen extends StatelessWidget {
  static const routeName = '/searchSellerProduct';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => SearchSellerProductScreen());

  SearchSellerProductScreen();

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<SearchSellerProductViewModel>()..getList(),
      builder: (context, viewmodel, _) => Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextFormField(
            //initialValue: viewmodel.searchProductName,
            onFieldSubmitted: viewmodel.onSearchProductName,
            style: TextStyle(fontSize: 12.0),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
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
          actions: [
            IconButton(
              icon: Icon(
                Icons.filter_alt_sharp,
                size: 28.0,
              ),
              onPressed: () {},
            ),
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 28.0,
                ),
                onPressed: () {})
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
          child: ListView.builder(
            itemCount: viewmodel.auctions.length,
            itemBuilder: (context, index) =>
                SellerProductCard(viewmodel.auctions[index]),
          ),
        ),
      ),
    );
  }
}
