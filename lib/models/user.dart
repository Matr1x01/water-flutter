class User {
  int uid;
  String password;
  String name;

  User(this.uid, this.password, this.name);
  String getName() {
    return name;
  }

  String getPassword() {
    return password;
  }

  int getUid() {
    return uid;
  }

  void setName(String name) {
    this.name = name;
  }

  void setPassword(String pass) {
    // ignore: unnecessary_this
    this.password = pass;
  }

  void setUid(int uid) {
    this.uid = uid;
  }
}
