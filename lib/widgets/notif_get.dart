import 'package:flutter/foundation.dart';

class Notif with ChangeNotifier {
  int _count = 0;
  bool _isLiked = false;
  List<Map<String, dynamic>> _notifications = [];

  int get count => _count;
  bool get isLiked => _isLiked;
  List<Map<String, dynamic>> get notifications => _notifications;

  void toggleLike() {
    _isLiked = !_isLiked;
    notifyListeners();
  }

  void addNotification(Map<String, dynamic> notification) {
    _notifications.add(notification);
    notifyListeners();
  }

}
