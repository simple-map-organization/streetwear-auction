import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilterAuction extends StatefulWidget {
  static const routeName = '/filterAuction';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => FilterAuction());

  @override
  _FilterAuctionState createState() => _FilterAuctionState();
}

class _FilterAuctionState extends State<FilterAuction> {
  double _sliderValue1 = 10;
  double _sliderValue2 = 10;
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
        title: Text('Filter'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FilterTitle(title: 'Ending within (hours)'),
              Container(
                padding: EdgeInsets.all(10),
                child: Slider(
                  min: 0,
                  max: 100,
                  value: _sliderValue1,
                  onChanged: (double value) => setState(() {
                    _sliderValue1 = value;
                  }),
                ),
              ),
              FilterTitle(title: 'Brand'),
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                        fillColor: Color.fromRGBO(235, 235, 235, 1),
                        filled: true)),
              ),
              FilterTitle(title: 'Condition'),
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Brand new'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Used'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FilterTitle(title: 'Price range (BIN)'),
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
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
                              hintText: 'min',
                              fillColor: Color.fromRGBO(235, 235, 235, 1),
                              filled: true)),
                    ),
                    SizedBox(
                      width: 100,
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
                              hintText: 'max',
                              fillColor: Color.fromRGBO(235, 235, 235, 1),
                              filled: true)),
                    ),
                  ],
                ),
              ),
              FilterTitle(title: 'Price range (current)'),
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
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
                              hintText: 'min',
                              fillColor: Color.fromRGBO(235, 235, 235, 1),
                              filled: true)),
                    ),
                    SizedBox(
                      width: 100,
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
                              hintText: 'max',
                              fillColor: Color.fromRGBO(235, 235, 235, 1),
                              filled: true)),
                    ),
                  ],
                ),
              ),
              FilterTitle(title: 'Size'),
              Container(
                padding: EdgeInsets.all(10),
                child: Slider(
                  min: 0,
                  max: 100,
                  value: _sliderValue2,
                  onChanged: (double value) => setState(() {
                    _sliderValue2 = value;
                  }),
                ),
              ),
              FilterTitle(title: 'Seller Rating'),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: RatingBar.builder(
                    initialRating: 0,
                    allowHalfRating: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (double value) => print(value),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Filter'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                    ),
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

class FilterTitle extends StatelessWidget {
  final String title;
  FilterTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
