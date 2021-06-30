import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/auction.dart';
import 'package:streetwear_auction_application/models/notification.dart';
import 'package:streetwear_auction_application/screens/auction_detail/auction_detail.dart';
import 'package:streetwear_auction_application/screens/my_purchase/purchase_view.dart';
import 'package:streetwear_auction_application/screens/seller_product/seller_product_view.dart';
import 'package:streetwear_auction_application/services/auction/auction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:streetwear_auction_application/services/notification/notification_service.dart';

class NotificationCard extends StatelessWidget {
  Function navigate;
  Function updateNotification;
  final Noti notification;
  String content;
  Function haha;

  NotificationCard(
      {this.notification, this.navigate, this.updateNotification, this.haha});

  IconData getIcon() {
    switch (notification.type) {
      case 'shipout':
        return Icons.local_shipping;
        break;

      case 'ending':
        return Icons.schedule;
        break;

      case 'reminderToShip':
        return Icons.hourglass_top;
        break;

      case 'reminderToPay':
        return Icons.hourglass_top;
        break;

      case 'outbidded':
        return Icons.sentiment_dissatisfied_outlined;
        break;

      case 'wonAnAuction':
        return Icons.check_circle_outline;
        break;

      case 'auctionEnded':
        return Icons.done_all;
        break;

      case 'havePaid':
        return Icons.monetization_on_outlined;
        break;

      default:
        return null;
    }
  }

  String getContent() {
    switch (notification.type) {
      case 'shipout':
        return 'Your order on ${notification.shortProductName} is being shipped out!';
        break;

      case 'ending':
        return 'Your watchlist on ${notification.shortProductName} is ending in 1 hour!';
        break;

      case 'reminderToShip':
        return 'Reminder to ship out your ${notification.shortProductName}! You have 2 day left!';
        break;

      case 'reminderToPay':
        return 'Reminder to pay for the ${notification.shortProductName} you have won! You have 1 day left!';
        break;

      case 'outbidded':
        return 'You have been outbidded on ${notification.shortProductName}!';
        break;

      case 'wonAnAuction':
        return 'You have won an auction on ${notification.shortProductName}! Please make your payment within 7 days.';
        break;

      case 'auctionEnded':
        return 'Your auction on ${notification.shortProductName} has ended!';
        break;

      case 'havePaid':
        return 'Your auction on ${notification.shortProductName} has been paid. Please ship out the product within 3 days!';
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print(notification.dateTime);
        await updateNotification(notification);
        navigate();
      },
      child: Container(
          margin: EdgeInsets.only(
            top: 2,
          ),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 10,
                      child: Icon(getIcon(), color: Colors.grey, size: 26.0)),
                  Expanded(
                    flex: 100,
                    child: Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: Text(
                          getContent(),
                          style: notification.read == true
                              ? TextStyle(fontSize: 15.0)
                              : TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Expanded(
                      flex: 10,
                      child: IconButton(
                          icon: Icon(Icons.chevron_right,
                              color: Colors.grey, size: 26.0),
                          onPressed: () {})
                      // onPressed: haha),
                      )
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 30.0),
                child: Text(
                  DateFormat('yyyy-MM-dd kk:mm')
                      .format(notification.dateTime.toLocal())
                      .toString(),
                  style: notification.read == true
                      ? null
                      : TextStyle(fontWeight: FontWeight.bold),
                )),
          ])),
    );
  }
}
