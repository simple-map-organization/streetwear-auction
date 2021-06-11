import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/start_auction/start_auction_viewmodel.dart';
import 'package:streetwear_auction_application/screens/view.dart';

import 'widgets/start_auction_textfield.dart';

class StartAuctionScreen extends StatelessWidget {
  static const routeName = '/startAuction';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => StartAuctionScreen());

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<StartAuctionViewModel>()..init(),
      builder: (context, viewmodel, _) => Scaffold(
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
            child: Form(
              key: viewmodel.formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      isDense: true,
                      value: viewmodel.category,
                      iconSize: 24,
                      elevation: 16,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String newValue) {
                        viewmodel.changeCategory(newValue);
                      },
                      items: viewmodel.categories
                          .map<DropdownMenuItem<String>>((String value) {
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
                    child: StartAuctionTextField(
                        hintText: 'Product Name',
                        controller: viewmodel.productNameController),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: StartAuctionTextField(
                        hintText: 'Product SKU',
                        controller: viewmodel.productSKUController),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: StartAuctionTextField(
                        hintText: 'Product name in short',
                        controller: viewmodel.shortProductNameController),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                    child: Row(children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: Text('Condition: ',
                              style: TextStyle(fontSize: 13)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              isDense: true,
                              value: viewmodel.condition,
                              iconSize: 24,
                              elevation: 16,
                              underline: Container(
                                height: 0,
                              ),
                              onChanged: (String newValue) {
                                viewmodel.changeCondition(newValue);
                              },
                              items: viewmodel.conditions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(fontSize: 13)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: Text('Size: ', style: TextStyle(fontSize: 13)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              isDense: true,
                              value: viewmodel.size,
                              iconSize: 24,
                              elevation: 16,
                              underline: Container(
                                height: 0,
                              ),
                              onChanged: (String newValue) {
                                viewmodel.changeSize(newValue);
                              },
                              items: viewmodel.sizes
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(fontSize: 13)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: StartAuctionTextField(
                        hintText: 'BIN', controller: viewmodel.binController),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   margin: EdgeInsets.only(right: 10, left: 10),
                  //   child: TextFormField(
                  //       style: TextStyle(fontSize: 13),
                  //       decoration: InputDecoration(
                  //           isDense: true,
                  //           contentPadding: EdgeInsets.all(15.0),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10.0),
                  //             ),
                  //           ),
                  //           hintText: 'Starting price',
                  //           fillColor: Color.fromRGBO(235, 235, 235, 1),
                  //           filled: true)),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   margin: EdgeInsets.only(right: 10, left: 10),
                  //   child: TextFormField(
                  //       style: TextStyle(fontSize: 13),
                  //       decoration: InputDecoration(
                  //           isDense: true,
                  //           contentPadding: EdgeInsets.all(15.0),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10.0),
                  //             ),
                  //           ),
                  //           hintText: 'Min. increment',
                  //           fillColor: Color.fromRGBO(235, 235, 235, 1),
                  //           filled: true)),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   margin: EdgeInsets.only(right: 10, left: 10),
                  //   child: TextFormField(
                  //       style: TextStyle(fontSize: 13),
                  //       decoration: InputDecoration(
                  //           isDense: true,
                  //           contentPadding: EdgeInsets.all(15.0),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10.0),
                  //             ),
                  //           ),
                  //           hintText: 'BIN',
                  //           fillColor: Color.fromRGBO(235, 235, 235, 1),
                  //           filled: true)),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   margin: EdgeInsets.only(right: 10, left: 10),
                  //   child: TextFormField(
                  //       style: TextStyle(fontSize: 13),
                  //       decoration: InputDecoration(
                  //           isDense: true,
                  //           contentPadding: EdgeInsets.all(15.0),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10.0),
                  //             ),
                  //           ),
                  //           hintText: 'Delivery fee',
                  //           fillColor: Color.fromRGBO(235, 235, 235, 1),
                  //           filled: true)),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   margin: EdgeInsets.only(right: 10, left: 10),
                  //   child: TextFormField(
                  //       style: TextStyle(fontSize: 13),
                  //       decoration: InputDecoration(
                  //           isDense: true,
                  //           contentPadding: EdgeInsets.all(15.0),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10.0),
                  //             ),
                  //           ),
                  //           hintText: 'COD',
                  //           fillColor: Color.fromRGBO(235, 235, 235, 1),
                  //           filled: true)),
                  // ),
                  // Row(children: <Widget>[
                  //   Expanded(
                  //     flex: 9,
                  //     child: Container(
                  //       padding: EdgeInsets.all(5),
                  //       margin: EdgeInsets.only(right: 10, left: 10),
                  //       child: TextFormField(
                  //           style: TextStyle(fontSize: 13),
                  //           decoration: InputDecoration(
                  //               isDense: true,
                  //               contentPadding: EdgeInsets.all(15.0),
                  //               border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.all(
                  //                   Radius.circular(10.0),
                  //                 ),
                  //               ),
                  //               hintText: 'End Time',
                  //               fillColor: Color.fromRGBO(235, 235, 235, 1),
                  //               filled: true)),
                  //     ),
                  //   ),
                  //   Expanded(
                  //       flex: 1,
                  //       child: IconButton(
                  //         icon: Icon(Icons.calendar_today),
                  //         //onPressed: () => _selectDate(context),
                  //         onPressed: () {},
                  //       ))
                  // ]),
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   margin: EdgeInsets.only(right: 10, left: 10),
                  //   child: TextFormField(
                  //       keyboardType: TextInputType.multiline,
                  //       maxLines: 5,
                  //       style: TextStyle(fontSize: 13),
                  //       decoration: InputDecoration(
                  //           isDense: true,
                  //           contentPadding: EdgeInsets.all(15.0),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10.0),
                  //             ),
                  //           ),
                  //           hintText: 'Description',
                  //           fillColor: Color.fromRGBO(235, 235, 235, 1),
                  //           filled: true)),
                  // ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        if (viewmodel.formKey.currentState.validate()) {
                          viewmodel.createAuction(context);
                        }
                      },
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
        ),
      ),
    );
  }
}
