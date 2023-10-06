import 'package:flutter/material.dart';
import 'package:project_uts/model/user.dart';
import 'package:project_uts/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User? getUser() {
    if (_user != null) {
      return _user;
    }
    return _user;
  }

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
