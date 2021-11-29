class AuthServices {
  var dataBase = {"1": "pass", "2": "word"};

  bool userAuth(String id, String password) {
    return dataBase[id] == password;
  }

  void addUser(String id, String password) {
    dataBase.addAll({id: password});
  }
}
