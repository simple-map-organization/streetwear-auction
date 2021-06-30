import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/notification.dart';
import 'package:streetwear_auction_application/services/notification/notification_service.dart';

import '../rest.dart';

class NotificationServiceRest implements NotificationService {
  final rest = dependency<RestService>();

  Future<void> createNotification() {}

  Future<List<Noti>> getAllNotifications() async {
    String endPoint = "notification";
    var jsonList = await rest.get(endPoint);
    print(jsonList);
    // if (jsonList != null) {
    List<Noti> notiList =
        (jsonList as List).map((json) => Noti.fromJson(json)).toList();
    return notiList;
    // }
  }

  Future<String> getNotificationCount() async {
    var endpoint = "notification/count";
    var jsonCount = await rest.get(endpoint);
    return jsonCount.toString();
  }

  Future<void> updateNotification(
      String notificationType, String auctionId) async {
    var endpoint = "notification";
    await rest.put(endpoint,
        data: {'type': notificationType, 'auctionId': auctionId});
  }
}
