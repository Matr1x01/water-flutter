class AuthServices {
  var dataBase = {"1": "pass", "2": "word"};
  var userNames = {"1": "max", "2": "rob"};
  var regCode = [11, 10];

  bool userAuth(String id, String password) {
    return dataBase[id] == password;
  }

  void addUser(String id, String password) {
    dataBase.addAll({id: password});
  }

  bool authInvCode(int code) {
    if (regCode.contains(code)) {
      return true;
    } else {
      return false;
    }
  }

  String getUserNameById(int id) {
    return userNames[id.toString()]!;
  }
}
