import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/seller_product/seller_product_view.dart';
//import 'seller_product_screen.dart';

class StartAuctionScreen extends StatefulWidget {
  @override
  _StartAuctionScreenState createState() => _StartAuctionScreenState();
}

class _StartAuctionScreenState extends State<StartAuctionScreen> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String dropdownValue = 'Sneakers';
  var selection = [
    'Sneakers',
    'Clothings',
    'Accessories',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text('Start an Auction'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  value: dropdownValue,
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items:
                      selection.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Product Name',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Product SKU',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Brand',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Product name in short',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Condition',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Starting price',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Min. increment',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'BIN',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Delivery fee',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'COD',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                        style: TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            hintText: 'End Time',
                            fillColor: Color.fromRGBO(235, 235, 235, 1),
                            filled: true)),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context)))
              ]),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Description',
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SellerProductScreen()),
                  ),
                  child: const Text('Submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
