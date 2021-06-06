import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/view.dart';

import 'seller_product_viewmodel.dart';

/* class SellerProduct extends StatefulWidget {
  @override
  _SellerProductState createState() => _SellerProductState();
}

class _SellerProductState extends State<SellerProduct> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            bottom: TabBar(
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
              ],
            ),
            title: Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: TextField(
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(12.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(235, 235, 235, 1),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: Color.fromRGBO(235, 235, 235, 1),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              hintText: 'Product Name',
                              fillColor: Color.fromRGBO(235, 235, 235, 1),
                              filled: true)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.filter_alt,
                        color: Color.fromRGBO(235, 235, 235, 1),
                        size: 33,
                      ),
                      // onPressed: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (_) => SellerProductFilter()),
                      // ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Color.fromRGBO(235, 235, 235, 1),
                          size: 33,
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
            )),
        body: TabBarView(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: ListView(
                children: [
                  SellerProductCard(),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: ListView(
                children: [
                  OngoingSellerProductCard(),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: ListView(
                children: [
                  SellerProductCard(),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: ListView(
                children: [
                  SellerProductCard(),
                ],
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
    );
  }
} */

class SellerProduct extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => SellerProduct());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            bottom: TabBar(
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
              ],
            ),
            title: ConsumerView(
              viewmodel: dependency<SellerProductViewModel>(),
              builder: (context, viewmodel, _) => Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(12.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(235, 235, 235, 1),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Color.fromRGBO(235, 235, 235, 1),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                hintText: 'Product Name',
                                fillColor: Color.fromRGBO(235, 235, 235, 1),
                                filled: true)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.filter_alt,
                          color: Color.fromRGBO(235, 235, 235, 1),
                          size: 33,
                        ),
                        // onPressed: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (_) => SellerProductFilter()),
                        // ),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Color.fromRGBO(235, 235, 235, 1),
                            size: 33,
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
            )),
        body: ConsumerView(
          viewmodel: dependency<SellerProductViewModel>()..getList(),
          builder: (context, viewmodel, _) => TabBarView(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView(
                  children: [
                    SellerProductCard(),
                  ],
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView(
                  children: [
                    OngoingSellerProductCard(),
                  ],
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView(
                  children: [
                    SellerProductCard(),
                  ],
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
                child: ListView(
                  children: [
                    SellerProductCard(),
                  ],
                ),
              ),
            ],
          ),
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
    );
  }
}
/* return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            bottom: TabBar(
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
              ],
            ),
            title: Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: TextField(
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(12.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(235, 235, 235, 1),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: Color.fromRGBO(235, 235, 235, 1),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              hintText: 'Product Name',
                              fillColor: Color.fromRGBO(235, 235, 235, 1),
                              filled: true)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.filter_alt,
                        color: Color.fromRGBO(235, 235, 235, 1),
                        size: 33,
                      ),
                      // onPressed: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (_) => SellerProductFilter()),
                      // ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Color.fromRGBO(235, 235, 235, 1),
                          size: 33,
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
            )),
        body: TabBarView(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: ListView(
                children: [
                  SellerProductCard(),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: ListView(
                children: [
                  OngoingSellerProductCard(),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: ListView(
                children: [
                  SellerProductCard(),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(235, 235, 235, 1)),
              child: ListView(
                children: [
                  SellerProductCard(),
                ],
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
    ); */
//   }
// }

class SellerProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 7.0),
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white,
      ),
      child: ExpansionCard(
        margin: EdgeInsets.only(top: 8, left: 8, right: 8),
        title: Container(
            child: Text('AJ1 UNC', style: TextStyle(color: Colors.black))),
        children: <Widget>[
          InkWell(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) => AuctionDetail()),
            // ),
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Image.network(
                      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
                      width: 200,
                      height: 200,
                    )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '#00034202\n' +
                                  'Date: 4th Mar 2021\n' +
                                  'Winning Bid: RM1600\n\n' +
                                  'SKU: 555088-134\n' +
                                  'Condition: BNIB\n' +
                                  'Size: US10\n\n' +
                                  'Payment Date: 5th Mar 2021 11:00PM\n' +
                                  'Receive Date: 8th Mar 2021 01:00PM\n\n',
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: RatingBar.builder(
                                  initialRating: 5,
                                  allowHalfRating: true,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) =>
                                      Icon(Icons.star, color: Colors.amber),
                                  onRatingUpdate: null)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OngoingSellerProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'AJ1 UNC',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                      child: Image.network(
                    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
                    width: 200,
                    height: 200,
                  )),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '#00034202\n' +
                            'Date: 4th Mar 2021\n\n' +
                            'SKU: 555088-134\n' +
                            'Condition: BNIB\n' +
                            'Size: US10\n\n' +
                            'BIN: RM 1800\n' +
                            'Current Bid: RM 90\n' +
                            'Payment Date: 5th Mar 2021 11:00PM\n',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
