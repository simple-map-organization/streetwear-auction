import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateSellerDialogBox extends StatelessWidget {
  final String seller;
  final Function setRating;
  const RateSellerDialogBox({Key key, this.seller, this.setRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Rate seller $seller',
        textAlign: TextAlign.center,
      ),
      content: RatingBar.builder(
        initialRating: 3,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          setRating(rating);
        },
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Confirm'),
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
