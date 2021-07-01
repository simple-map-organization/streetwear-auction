import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/auction.dart';

class PlaceBidDialog extends AlertDialog {
  final Auction auction;
  final TextEditingController bidController;
  final Function onPlaceBid;
  final formKey;

  PlaceBidDialog(
      this.auction, this.bidController, this.onPlaceBid, this.formKey);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter your bid amount '),
      content: Form(
        key: formKey,
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: (value) {
            if (value == null ||
                value == '' ||
                int.parse(value) < auction.minBid)
              return 'Minimum bid: RM${auction.minBid}';
            return null;
          },
          controller: bidController,
          decoration: InputDecoration(
              prefixText: 'RM',
              hintText: "Your bid here",
              helperText: 'Minimum bid: RM${auction.minBid}'),
        ),
      ),
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
          onPressed: onPlaceBid,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
