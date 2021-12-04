import 'package:flutter/foundation.dart';
import 'package:water_flutter/models/user.dart';

class UserState with ChangeNotifier {
  bool logedIn = false;
  User user = User(1, "", "");

  bool getLoginState() {
    return logedIn;
  }

  void setLoginState(bool value) {
    logedIn = value;
    notifyListeners();
  }

  void setUser(int id, String name, String pass) {
    user.setUid(id);
    user.setName(name);
    user.setPassword(pass);
  }

  int getUserid() {
    return user.uid;
  }

  String getName() {
    return user.name;
  }

  String getPassword() {
    return user.password;
  }
}
