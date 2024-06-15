import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(notifications[index].title),
            subtitle: Text(notifications[index].body),
            trailing: Text(
              notifications[index].time,
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }
}

// notification data
class Notification {
  final String title;
  final String body;
  final String time;

  Notification({
    required this.title,
    required this.body,
    required this.time,
  });
}

final List<Notification> notifications = [
  Notification(
    title: 'New Order',
    body: 'You have a new order from John',
    time: '2h ago',
  ),
  Notification(
    title: 'Delivery Update',
    body: 'Your order is out for delivery',
    time: '1d ago',
  ),
  Notification(
    title: 'Reminder',
    body: "Don't forget to rate your recent order",
    time: '2d ago',
  ),
  Notification(
    title: 'New Order',
    body: 'You have a new order from John',
    time: '2h ago',
  ),
  Notification(
    title: 'Delivery Update',
    body: 'Your order is out for delivery',
    time: '1d ago',
  ),
  Notification(
    title: 'Reminder',
    body: "Don't forget to rate your recent order",
    time: '2d ago',
  ),
  Notification(
    title: 'New Order',
    body: 'You have a new order from John',
    time: '2h ago',
  ),
  Notification(
    title: 'Delivery Update',
    body: 'Your order is out for delivery',
    time: '1d ago',
  ),
  Notification(
    title: 'Reminder',
    body: "Don't forget to rate your recent order",
    time: '2d ago',
  ),
  Notification(
    title: 'New Order',
    body: 'You have a new order from John',
    time: '2h ago',
  ),
  Notification(
    title: 'Delivery Update',
    body: 'Your order is out for delivery',
    time: '1d ago',
  ),
  Notification(
    title: 'Reminder',
    body: "Don't forget to rate your recent order",
    time: '2d ago',
  ),
  Notification(
    title: 'New Order',
    body: 'You have a new order from John',
    time: '2h ago',
  ),
  Notification(
    title: 'Delivery Update',
    body: 'Your order is out for delivery',
    time: '1d ago',
  ),
  Notification(
    title: 'Reminder',
    body: "Don't forget to rate your recent order",
    time: '2d ago',
  ),
  // Add more notifications here
];
