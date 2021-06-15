import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/start_auction/start_auction_viewmodel.dart';
import 'package:streetwear_auction_application/screens/view.dart';

import 'widgets/start_auction_textfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class StartAuctionScreen extends StatelessWidget {
  static const routeName = '/startAuction';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => StartAuctionScreen());

  Widget buildGridView(List<Asset> images) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          );
        }),
      ),
    );
  }

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
            physics: ScrollPhysics(),
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
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: StartAuctionTextField(
                        hintText: 'Starting Price',
                        controller: viewmodel.startingPriceController),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: StartAuctionTextField(
                        hintText: 'Min Increment',
                        controller: viewmodel.minIncrementController),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    child: StartAuctionTextField(
                        hintText: 'Delivery Fee',
                        controller: viewmodel.deliveryFeeController),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                    child: Row(children: <Widget>[
                      Expanded(
                        flex: 9,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (viewmodel.selectedDate == null)
                                  ? 'End Time'
                                  : '${viewmodel.selectedDate}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () async {
                                final DateTime picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2050));
                                if (picked != null &&
                                    picked != viewmodel.selectedDate) {
                                  viewmodel.changeDate(picked);
                                }
                              }))
                    ]),
                  ),
                  Container(
                    //padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await viewmodel.loadAssets();
                        },
                        icon: Icon(
                          Icons.image,
                        ),
                        label: Text('Pick Images'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: buildGridView(viewmodel.images),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          if (viewmodel.formKey.currentState.validate() &&
                              viewmodel.selectedDate != null &&
                              (viewmodel.images != null) &&
                              (viewmodel.images.length > 0)) {
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
