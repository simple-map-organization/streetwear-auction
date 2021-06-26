import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streetwear_auction_application/models/purchase.dart';

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
            children: [
              Row(
                children: [
                  Expanded(child: Text('Name')),
                  Expanded(
                    child: Row(
                      children: [
                        Text(purchase.fullname),
                        TextButton(
                            onPressed: () {
                              _onCopy(purchase.fullname, context);
                            },
                            child: Text('copy'))
                      ],
                    ),
                    flex: 2,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Phone Number')),
                  Expanded(
                    child: Row(
                      children: [
                        Text(purchase.phone),
                        TextButton(
                            onPressed: () {
                              _onCopy(purchase.phone.toString(), context);
                            },
                            child: Text('copy'))
                      ],
                    ),
                    flex: 2,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Address')),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${purchase.address1} ${purchase.address2},${purchase.postcode} ${purchase.state},${purchase.country}',
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              _onCopy(
                                  "${purchase.address1} ${purchase.address2},${purchase.postcode} ${purchase.state},${purchase.country}",
                                  context);
                            },
                            child: Text('copy'))
                      ],
                    ),
                    flex: 2,
                  ),
                ],
              ),
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
