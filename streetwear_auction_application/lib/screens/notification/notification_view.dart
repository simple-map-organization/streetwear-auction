import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../view.dart';
import 'notification_viewmodel.dart';
import 'widgets/notificationCard.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notificationscreen';
  static Route<dynamic> createRoute(args) =>
      MaterialPageRoute(builder: (_) => NotificationScreen());

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<NotificationViewModel>()..init(),
      builder: (context, viewmodel, _) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context),
          ),
          shadowColor: Colors.transparent,
          title: Text('Notification', style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
        body: viewmodel.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: viewmodel.notifications.length,
                itemBuilder: (context, index) => NotificationCard(
                  notification: viewmodel.notifications[index],
                  navigate: viewmodel.navigate(
                      viewmodel.notifications[index], context),
                  updateNotification: viewmodel.updateNotification,
                ),
              ),
      ),
    );
  }
}
