import 'package:flutter/widgets.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/auction.dart';
import 'package:streetwear_auction_application/models/notification.dart';
import 'package:streetwear_auction_application/screens/auction_detail/auction_detail.dart';
import 'package:streetwear_auction_application/screens/my_purchase/purchase_view.dart';
import 'package:streetwear_auction_application/screens/seller_product/seller_product_view.dart';
import 'package:streetwear_auction_application/services/auction/auction_service.dart';
import 'package:streetwear_auction_application/services/notification/notification_service.dart';

import '../viewmodel.dart';

class NotificationViewModel extends Viewmodel {
  // List<Noti> notifications = [
  //   Noti(
  //       productShortName: "AJ1 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu",
  //       type: "ending",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ2 UNC",
  //       auctionId: '60c8563cdfa5e123745fca52',
  //       userId: "huhu2",
  //       type: "shipout",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ3 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu",
  //       type: "reminderToPay",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ4 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu2",
  //       type: "reminderToShip",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ5 UNC",
  //       auctionId: '60c8563cdfa5e123745fca52',
  //       userId: "huhu2",
  //       type: "outbidded",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ6 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu2",
  //       type: "wonAnAuction",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ4 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu2",
  //       type: "reminderToPay",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ5 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu2",
  //       type: "outbidded",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ6 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu2",
  //       type: "wonAnAuction",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ4 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu2",
  //       type: "reminderToPay",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ5 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu2",
  //       type: "outbidded",
  //       time: new DateTime.now()),
  //   Noti(
  //       productShortName: "AJ6 UNC",
  //       auctionId: '60c8563cdfa5e123745fca54',
  //       userId: "huhu2",
  //       type: "wonAnAuction",
  //       time: new DateTime.now())
  // ];
  List<Noti> notifications;
  NotificationService get notificationService => dependency();
  AuctionService get dataService => dependency();

  void init() async {
    turnBusy();
    notifications = await notificationService.getAllNotifications();
    turnIdle();
  }

  Future<void> updateNotification(notification) async {
    print("pressed2");
    await notificationService.updateNotification(
        notification.type, notification.auction.auctionId);
    print(notification.type);
    print(notification.auction.auctionId);
  }

  Function navigate(notification, context) {
    // print("sf");
    // print(notification.type);
    // print(notification.auction.auctionId);
    switch (notification.type) {
      case 'shipout':
        return () async {
          await Navigator.of(context).pushNamed(PurchaseScreen.routeName,
              arguments: {'arg': 'To Receive'});
          init();
        };

      case 'ending':
        return () async {
          Auction auction =
              await dataService.getAuction(notification.auction.auctionId);
          await Navigator.of(context).pushNamed(AuctionDetailScreen.routeName,
              arguments: {'auction': auction});
          init();
        };

      case 'reminderToShip':
        return () async {
          await Navigator.of(context)
              .pushNamed(SellerProductScreen.routeName, arguments: {'arg': 3});
          init();
        };

      case 'reminderToPay':
        return () async {
          await Navigator.of(context).pushNamed(PurchaseScreen.routeName,
              arguments: {'arg': 'To Pay'});
          init();
        };

      case 'outbidded':
        return () async {
          Auction auction =
              await dataService.getAuction(notification.auction.auctionId);
          await Navigator.of(context).pushNamed(AuctionDetailScreen.routeName,
              arguments: {'auction': auction});
          init();
        };

      case 'wonAnAuction':
        return () async {
          Auction auction =
              await dataService.getAuction(notification.auction.auctionId);
          await Navigator.of(context).pushNamed(AuctionDetailScreen.routeName,
              arguments: {'auction': auction});
          init();
        };

      case 'auctionEnded':
        return () async {
          Auction auction =
              await dataService.getAuction(notification.auction.auctionId);
          await Navigator.of(context).pushNamed(AuctionDetailScreen.routeName,
              arguments: {'auction': auction});
          init();
        };
    }
  }
}
