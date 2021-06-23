import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/models/purchase.dart';
import 'package:streetwear_auction_application/screens/auction_checkout/auction_checkout_viewmodel.dart';
import 'package:streetwear_auction_application/screens/view.dart';

class AuctionCheckoutScreen extends StatelessWidget {
  static const routeName = '/auctionCheckout';
  static MaterialPageRoute createRoute(args) => MaterialPageRoute(
      builder: (_) => AuctionCheckoutScreen(
          args['purchase'], args['price'], args['deliveryFee']));

  AuctionCheckoutScreen(this.purchase, this.price, this.deliveryFee);
  final Purchase purchase;
  final int price;
  final int deliveryFee;
  final _formKey = GlobalKey<FormState>();

  final states = const [
    'Perlis',
    'Kedah',
    'Penang',
    'Kelantan',
    'Terengganu',
    'Pahang',
    'Perak',
    'Selangor',
    'Kuala Lumpur',
    'Putrajaya',
    'Negeri Sembilan',
    'Melaka',
    'Johor',
    'Labuan',
    'Sabah',
    'Sarawak'
  ];

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
        viewmodel: AuctionCheckoutViewModel()..init(purchase),
        builder: (context, viewmodel, __) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Information',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(height: 14.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length < 5) return 'Name too short';
                                return null;
                              },
                              controller: viewmodel.fullnameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                labelStyle: TextStyle(fontSize: 12.0),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10.0),
                                isCollapsed: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length < 10)
                                  return 'Phone number too short';
                                return null;
                              },
                              controller: viewmodel.phoneNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefix: Text('+6 '),
                                labelText: 'Phone number',
                                labelStyle: TextStyle(fontSize: 12.0),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10.0),
                                isCollapsed: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length == 0)
                                  return 'Address cannot be empty';
                                return null;
                              },
                              controller: viewmodel.address1Controller,
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                labelText: 'Address line 1',
                                labelStyle: TextStyle(fontSize: 12.0),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10.0),
                                isCollapsed: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: viewmodel.address2Controller,
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                labelText: 'Address line 2',
                                labelStyle: TextStyle(fontSize: 12.0),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10.0),
                                isCollapsed: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DropdownButtonFormField(
                              value: 'Perak',
                              items: [
                                ...states
                                    .map((state) => DropdownMenuItem(
                                          child: Text(state),
                                          value: state,
                                        ))
                                    .toList()
                              ],
                              onChanged: (_state) {
                                viewmodel.state = _state;
                              },
                              decoration: InputDecoration(
                                labelText: 'State',
                                labelStyle: TextStyle(fontSize: 12.0),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10.0),
                                isCollapsed: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length != 5)
                                  return 'Postcode is invalid';
                                return null;
                              },
                              controller: viewmodel.postcodeController,
                              keyboardType: TextInputType.number,
                              maxLength: 5,
                              decoration: InputDecoration(
                                labelText: 'Postcode',
                                labelStyle: TextStyle(fontSize: 12.0),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(10.0),
                                isCollapsed: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Summary',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Item price'),
                              ),
                              Text(price.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Delivery'),
                              ),
                              Text(deliveryFee.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Total Amount'),
                              ),
                              Text(
                                'RM${(price + deliveryFee)}',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300])),
                        padding: const EdgeInsets.only(
                            top: 14.0, bottom: 14.0, right: 10.0),
                        child: Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            Expanded(
                              child: Text(
                                  'I have read and consent to eShopWorld processing my information in accordance with the Privacy Statement and Cookie Policy. eShopWorld is a trusted Nike partner.'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              child: MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  if (!_formKey.currentState.validate()) return;
                  await viewmodel.onPay();
                  final snackBar = SnackBar(content: Text('Paid successful!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text(
                  'Proceed to payment',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        });
  }
}
