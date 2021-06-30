import 'package:streetwear_auction_application/models/notification.dart';

abstract class NotificationService {
  Future<void> createNotification();
  Future<List<Noti>> getAllNotifications();
  Future<String> getNotificationCount();
  Future<void> updateNotification(String notificationType, String auctionId);
}
