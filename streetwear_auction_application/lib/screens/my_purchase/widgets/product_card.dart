import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:streetwear_auction_application/models/purchase.dart';

class ProductCard extends StatelessWidget {
  final Purchase purchase;
  final Function function;
  ProductCard({this.purchase, this.function});

  final btnText = {
    'To Pay': 'Pay',
    'To Rate': 'Rate',
    'To Receive': 'Received',
    'To Ship': null
  };

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
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
                '${purchase.product.productSKU} ' +
                    (purchase.won ? '(${purchase.status})' : ''),
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 120,
                    height: 100,
                    child: Center(
                      child: Image.network(
                        purchase.product.photos[0],
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Date : ${DateFormat.yMd().add_jm().format(purchase.product.endTime)}\n' +
                            'Winning Bid : RM0\n' +
                            'Condition: ${purchase.product.condition}\n' +
                            'Size :${purchase.product.size}\n' +
                            (purchase.won
                                ? 'Pay before :\n${purchase.payBefore}'
                                : ''),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 5,
        right: 25,
        child: Container(
          width: 90,
          height: 28,
          child: btnText[purchase.status] != null
              ? ElevatedButton(
                  onPressed: function,
                  child: Text(btnText[purchase.status]),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                )
              : Container(),
        ),
      )
    ]);
  }
}
