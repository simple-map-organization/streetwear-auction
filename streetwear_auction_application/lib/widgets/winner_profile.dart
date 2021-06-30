import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/purchase.dart';

class WinnerProfile extends StatelessWidget {
  final Purchase purchase;
  const WinnerProfile({Key key, this.purchase}) : super(key: key);

  void _onCopy(String text, context) {
    Clipboard.setData(new ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 20.0, bottom: 20.0, left: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.payment,
                    size: 18.0,
                  ),
                  SizedBox(width: 8.0),
                  Text('Status',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  SizedBox(width: 26.0),
                  purchase.paidOn != null
                      ? Text('Paid')
                      : Text('Payment Pending'),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Divider(),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18.0,
                  ),
                  SizedBox(width: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Address',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      TextButton(
                          onPressed: () {
                            _onCopy(
                                '${purchase.fullname}\n+6${purchase.phone}\n${purchase.address1} ${purchase.address2},${purchase.postcode} ${purchase.state},${purchase.country}',
                                context);
                          },
                          child: Text('copy'))
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 26.0),
                  Flexible(
                    child: Text(
                        '${purchase.fullname}\n+6${purchase.phone}\n${purchase.address1} ${purchase.address2},${purchase.postcode} ${purchase.state},${purchase.country}'),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Divider(),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
