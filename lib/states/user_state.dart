import 'package:flutter/foundation.dart';

class UserState with ChangeNotifier {
  bool logedIn = false;
  String userId = "";
  String password = "";

  bool getLoginState() {
    return logedIn;
  }

  void setLoginState(bool value) {
    logedIn = value;
    notifyListeners();
  }

  void setUser(String id, String pass) {
    userId = id;
    password = pass;
  }

  String getUserid() {
    return userId;
  }

  String getPassword() {
    return password;
  }
}
