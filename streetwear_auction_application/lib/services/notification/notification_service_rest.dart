import '../../app/dependencies.dart';
import '../../models/notification.dart';
import '../rest.dart';
import 'notification_service.dart';

class NotificationServiceRest implements NotificationService {
  final rest = dependency<RestService>();

  Future<List<Noti>> getAllNotifications() async {
    String endPoint = "notification";
    var jsonList = await rest.get(endPoint);
    List<Noti> notiList =
        (jsonList as List).map((json) => Noti.fromJson(json)).toList();
    return notiList;
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
