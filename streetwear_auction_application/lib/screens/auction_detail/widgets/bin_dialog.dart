import 'package:flutter/material.dart';

import '../../../models/auction.dart';

class BINDialog extends AlertDialog {
  final Auction auction;
  final Function onBin;
  BINDialog(this.auction, this.onBin);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure?'),
      content: RichText(
          text: TextSpan(
              text: 'You are buying it at ',
              style: TextStyle(color: Colors.black),
              children: [
            TextSpan(
                text: 'RM${auction.bin}',
                style: TextStyle(color: Theme.of(context).primaryColor))
          ])),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: onBin,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
