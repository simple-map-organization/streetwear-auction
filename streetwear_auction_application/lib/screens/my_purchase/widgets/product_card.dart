import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:streetwear_auction_application/models/purchase.dart';

class ProductCard extends StatelessWidget {
  final Purchase purchase;
  final Function function;
  ProductCard({this.purchase, this.function});

  final btnText = {
    'Payment Pending': 'Pay',
    'To Rate': 'Rate',
    'To Receive': 'Received',
    'To Ship': null,
    'Completed': null,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${purchase.product.productSKU} ' +
                  (purchase.won
                      ? '(${purchase.product.status == 'Payment Pending' ? 'To Pay' : purchase.product.status})'
                      : ''),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    purchase.product.photos[0],
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date : ${DateFormat.yMd().add_jm().format(purchase.product.endTime)}\n' +
                              'Winning Bid : RM0\n' +
                              'Condition: ${purchase.product.condition}\n' +
                              'Size :${purchase.product.size}\n' +
                              (purchase.won
                                  ? 'Pay before :\n${purchase.payBefore}'
                                  : ''),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          width: double.infinity,
                          height: 28,
                          child: btnText[purchase.product.status] != null &&
                                  purchase.won
                              ? ElevatedButton(
                                  onPressed: function,
                                  child: Text(btnText[purchase.product.status]),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context).primaryColor),
                                  ),
                                )
                              : Container(),
                        )
                      ],
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
