import 'package:flutter/material.dart';
import 'package:project_uts/utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationScreen> {
  bool isLikeAnimatingRow = false;
  int likeCount = 0;

  final List<Map<String, dynamic>> notifications = [
    {
      'avatar': 'assets/img/muka.jpg',
      'username': 'Username 1',
      'content': 'liked your photo',
      'timestamp': '1 hour ago',
      'read': true,
    },
    {
      'avatar': 'assets/img/muka.jpg',
      'username': 'Username 2',
      'content': 'liked your photo',
      'timestamp': '1 hour ago',
      'read': true,
    },
    {
      'avatar': 'assets/img/muka.jpg',
      'username': 'Username 3',
      'content': 'liked your photo',
      'timestamp': '1 hour ago',
      'read': true,
    },
    {
      'avatar': 'assets/img/muka.jpg',
      'username': 'Username 4',
      'content': 'liked your photo',
      'timestamp': '1 hour ago',
      'read': true,
    },
    {
      'avatar': 'assets/img/muka.jpg',
      'username': 'Username 5',
      'content': 'liked your photo',
      'timestamp': '1 hour ago',
      'read': true,
    },
    {
      'avatar': 'assets/img/muka.jpg',
      'username': 'Username 6',
      'content': 'liked your photo',
      'timestamp': '1 hour ago',
      'read': true,
    },
    {
      'avatar': 'assets/img/muka.jpg',
      'username': 'Username 7',
      'content': 'liked your photo',
      'timestamp': '1 hour ago',
      'read': true,
    },
  ];
  // void updateLikeCount() {
  //   setState(() {
  //     if (isLikeAnimatingRow == false) {
  //       isLikeAnimatingRow = true;
  //       likeCount = 1;
  //       // Add a new like notification to the list
  //       notifications.add('Username liked your photo');
  //     } else {
  //       isLikeAnimatingRow = false;
  //       likeCount = 0;
  //       // Remove the last like notification from the list
  //       notifications.removeLast();
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mobileBackgroundColor,
        title: const Text('Notifications',
          style: TextStyle(color: yellow),),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final bool isRead = notification['read'] ?? false;
          return ListTile(
            onTap: () {
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage(notification['avatar']),
            ),
            title: Text(
              '${notification['username']} ${notification['content']}',
              style: TextStyle(
                fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Text(
              notification['timestamp'],
              style: TextStyle(
                color: isRead ? Colors.grey : yellow,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.mark_email_read),
              onPressed: () {
                setState(() {
                  notification['read'] = !isRead;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
