import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/purchase.dart';
import 'package:streetwear_auction_application/screens/my_purchase/purchase_viewmodel.dart';
import 'package:streetwear_auction_application/screens/my_purchase/widgets/rate_seller_dialog_box.dart';
import 'package:streetwear_auction_application/screens/view.dart';

import 'widgets/product_card.dart';

class PurchaseScreen extends StatelessWidget {
  static const routeName = '/purchase';
  static MaterialPageRoute createRoute() =>
      MaterialPageRoute(builder: (_) => PurchaseScreen());

  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<PurchaseViewModel>()..getPurchasedList(),
      builder: (context, viewmodel, _) => DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.white,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TabBar(
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                            width: 4.0, color: Theme.of(context).primaryColor),
                      ),
                      tabs: [
                        Tab(child: Text('WON')),
                        Tab(child: Text('LOST')),
                      ],
                    ),
                  ],
                )),
            body: TabBarView(children: [
              Container(
                decoration: BoxDecoration(
                    // color: Colors.black87,
                    color: Color.fromRGBO(235, 235, 235, 1)),
                child: Column(
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: DropdownButton<String>(
                            isExpanded: true,
                            isDense: true,
                            value: viewmodel.dropdownValue,
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (String newValue) {
                              viewmodel.setValue(newValue);
                            },
                            items: viewmodel.selection
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList())),
                    Expanded(
                      child: ListView.builder(
                        itemCount: viewmodel.disaplayWinPurchaseList.length,
                        itemBuilder: (context, index) => ProductCard(
                            purchase: viewmodel.disaplayWinPurchaseList[index],
                            function: () async {
                              if (viewmodel
                                      .disaplayWinPurchaseList[index].status ==
                                  "To Rate") {
                                viewmodel.sellerRating = 3.0;
                                final value = await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      RateSellerDialogBox(
                                    seller: (viewmodel
                                                .disaplayWinPurchaseList[index]
                                            as Purchase)
                                        .product
                                        .seller
                                        .username,
                                    setRating: viewmodel.setRating,
                                  ),
                                );
                                if (value == "Confirm") {
                                  viewmodel.updateStatus(
                                      purchase: viewmodel
                                          .disaplayWinPurchaseList[index],
                                      rating: viewmodel.sellerRating);
                                }
                              } else {
                                viewmodel.updateStatus(
                                    purchase: viewmodel
                                        .disaplayWinPurchaseList[index]);
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Colors.black87,
                    color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewmodel.lostPurchaseList.length,
                    itemBuilder: (context, index) => ProductCard(
                        purchase: viewmodel.lostPurchaseList[index])),
              ),
            ])),
      ),
    );
  }
}