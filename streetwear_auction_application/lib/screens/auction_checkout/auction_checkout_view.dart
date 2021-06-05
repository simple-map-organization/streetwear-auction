import 'package:flutter/material.dart';

class AuctionCheckoutScreen extends StatelessWidget {
  static const routeName = '/auctionCheckout';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => AuctionCheckoutScreen());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        initialValue: 'asd',
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
                        initialValue: '0123123123',
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
                        initialValue: 'NO 12, jln abc',
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
                        initialValue: 'taman abc',
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
                        value: 'perak',
                        items: [
                          DropdownMenuItem(
                            child: Text('perak'),
                            value: 'perak',
                          ),
                          DropdownMenuItem(
                            child: Text('penang'),
                            value: 'penang',
                          ),
                        ],
                        onChanged: (_state) {
                          print(_state);
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
                        initialValue: '12312',
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
                          child: Text('Deposit'),
                        ),
                        Text('100'),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text('Delivery'),
                        ),
                        Text('0'),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text('Total Amount'),
                        ),
                        Text(
                          'RM905',
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
          onPressed: () => () {},
          child: Text(
            'Proceed to payment',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
