import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final bool isAllowBid;
  final Function onPlaceBid;
  final Function onBuyItNow;
  final int bin;

  CustomBottomAppBar(
      this.isAllowBid, this.onPlaceBid, this.onBuyItNow, this.bin);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: MaterialButton(
                disabledColor: Colors.lightBlue[200],
                padding: EdgeInsets.symmetric(vertical: 16.0),
                color: Colors.lightBlue,
                onPressed: isAllowBid ? onPlaceBid : null,
                child: Text(
                  'Place Bid',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                disabledColor: Colors.green[200],
                padding: EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.green,
                onPressed: isAllowBid ? onBuyItNow : null,
                child: Text(
                  'Buy It Now\nRM$bin',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
