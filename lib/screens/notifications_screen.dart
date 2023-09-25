import 'package:flutter/material.dart';
import 'package:project_uts/utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        title: const Text(
          'Notification',
          style: TextStyle(color: yellow),
        ),
        centerTitle: true,
      ),
    );
  }
}
