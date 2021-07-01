import 'package:flutter/widgets.dart';

import '../../app/dependencies.dart';
import '../../models/auction.dart';
import '../../models/notification.dart';
import '../../services/auction/auction_service.dart';
import '../../services/notification/notification_service.dart';
import '../auction_detail/auction_detail.dart';
import '../my_purchase/purchase_view.dart';
import '../seller_product/seller_product_view.dart';
import '../viewmodel.dart';

class NotificationViewModel extends Viewmodel {
  List<Noti> notifications = [];
  NotificationService get notificationService => dependency();
  AuctionService get dataService => dependency();

  void init() async {
    turnBusy();
    notifications = await notificationService.getAllNotifications();
    turnIdle();
  }

  Future<void> updateNotification(notification) async {
    await notificationService.updateNotification(
        notification.type, notification.auction.auctionId);
  }

  Function navigate(notification, context) {
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

      case 'havePaid':
        return () async {
          await Navigator.of(context)
              .pushNamed(SellerProductScreen.routeName, arguments: {'arg': 3});
          init();
        };
    }
    return () {};
  }
}
